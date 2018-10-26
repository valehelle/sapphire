defmodule Sapphire.Repo.Migrations.CreateParameters do
  use Ecto.Migration

  def change do
    create table(:parameters) do
      add :name, :string
      add :config_id, references(:configs, on_delete: :nothing)

      timestamps()
    end

    create index(:parameters, [:config_id])
  end
end
