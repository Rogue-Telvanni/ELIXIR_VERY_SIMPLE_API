defmodule ApiTest.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :document, :integer
      add :address, :string
      add :phone, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:clients, [:document, :name])
  end
end
