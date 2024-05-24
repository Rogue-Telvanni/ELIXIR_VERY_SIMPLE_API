defmodule ApiTestWeb.ClientJSON do
  alias ApiTest.Clients.Client

  @doc """
  Renders a list of clients.
  """
  def index(%{clients: clients}) do
    %{data: for(client <- clients, do: data(client))}
  end

  @doc """
  Renders a single client.
  """
  def show(%{client: client}) do
    %{data: data(client)}
  end

  defp data(%Client{} = client) do
    %{
      id: client.id,
      name: client.name,
      document: client.document,
      address: client.address,
      phone: client.phone
    }
  end
end
