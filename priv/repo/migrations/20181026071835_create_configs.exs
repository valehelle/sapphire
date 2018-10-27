defmodule Sapphire.Repo.Migrations.CreateConfigs do
  use Ecto.Migration

  def change do
    create table(:configs) do
      add :url, :string
      add :type, :string
      add :delay, :integer
      add :is_selected, :boolean, default: false, null: false
      add :body, :map
      add :status_code, :integer
      add :param, :map
      add :endpoint_id, references(:endpoints, on_delete: :delete_all)

      timestamps()
    end

    create index(:configs, [:endpoint_id])
  end
end
