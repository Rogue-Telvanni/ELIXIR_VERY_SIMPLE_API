defmodule ApiTest.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clients" do
    field :name, :string
    field :address, :string
    field :document, :integer
    field :phone, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:id, :name, :document, :address, :phone])
    |> validate_required([:name, :document])
    |> unique_constraint(:document)
  end
end
