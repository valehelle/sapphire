defmodule Sapphire.Repo.Migrations.CreateEndpoints do
  use Ecto.Migration

  def change do
    create table(:endpoints) do
      add :name, :string
      add :project_id, references(:projects, on_delete: :delete_all)

      timestamps()
    end

    create index(:endpoints, [:project_id])
  end
end
