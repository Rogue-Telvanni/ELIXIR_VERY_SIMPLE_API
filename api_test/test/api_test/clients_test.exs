defmodule ApiTest.ClientsTest do
  use ApiTest.DataCase

  alias ApiTest.Clients

  describe "clients" do
    alias ApiTest.Clients.Client

    import ApiTest.ClientsFixtures

    @invalid_attrs %{name: nil, address: nil, document: nil, phone: nil}

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Clients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Clients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      valid_attrs = %{name: "some name", address: "some address", document: 42, phone: 42}

      assert {:ok, %Client{} = client} = Clients.create_client(valid_attrs)
      assert client.name == "some name"
      assert client.address == "some address"
      assert client.document == 42
      assert client.phone == 42
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", document: 43, phone: 43}

      assert {:ok, %Client{} = client} = Clients.update_client(client, update_attrs)
      assert client.name == "some updated name"
      assert client.address == "some updated address"
      assert client.document == 43
      assert client.phone == 43
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_client(client, @invalid_attrs)
      assert client == Clients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Clients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Clients.change_client(client)
    end
  end
end
