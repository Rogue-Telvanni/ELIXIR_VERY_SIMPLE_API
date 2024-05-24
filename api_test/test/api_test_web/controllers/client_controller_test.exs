defmodule ApiTestWeb.ClientControllerTest do
  use ApiTestWeb.ConnCase

  import ApiTest.ClientsFixtures

  alias ApiTest.Clients.Client

  @create_attrs %{
    name: "some name",
    address: "some address",
    document: 42,
    phone: 42
  }
  @update_attrs %{
    name: "some updated name",
    address: "some updated address",
    document: 43,
    phone: 43
  }
  @invalid_attrs %{name: nil, address: nil, document: nil, phone: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clients", %{conn: conn} do
      conn = get(conn, ~p"/api/clients")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create client" do
    test "renders client when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/clients", client: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/clients/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "document" => 42,
               "name" => "some name",
               "phone" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/clients", client: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update client" do
    setup [:create_client]

    test "renders client when data is valid", %{conn: conn, client: %Client{id: id} = client} do
      conn = put(conn, ~p"/api/clients/#{client}", client: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/clients/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "document" => 43,
               "name" => "some updated name",
               "phone" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, client: client} do
      conn = put(conn, ~p"/api/clients/#{client}", client: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete client" do
    setup [:create_client]

    test "deletes chosen client", %{conn: conn, client: client} do
      conn = delete(conn, ~p"/api/clients/#{client}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/clients/#{client}")
      end
    end
  end

  defp create_client(_) do
    client = client_fixture()
    %{client: client}
  end
end
