defmodule Sapphire.Repo.Migrations.CreateEndpoints do
  use Ecto.Migration

  def change do
    create table(:endpoints) do
      add :name, :string
      add :project_id, references(:projects, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)
      add :url, :string
      add :type, :string
      add :delay, :string
      add :body, :text
      add :status_code, :integer
      timestamps()
    end

    create index(:endpoints, [:project_id, :user_id])
  end
end
