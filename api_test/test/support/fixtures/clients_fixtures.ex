defmodule ApiTest.ClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiTest.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        address: "some address",
        document: 42,
        name: "some name",
        phone: 42
      })
      |> ApiTest.Clients.create_client()

    client
  end
end
