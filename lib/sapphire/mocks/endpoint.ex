defmodule Sapphire.Mocks.Endpoint do
  use Ecto.Schema
  import Ecto.Changeset


  schema "endpoints" do
    field :name, :string
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(endpoint, attrs) do
    endpoint
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
