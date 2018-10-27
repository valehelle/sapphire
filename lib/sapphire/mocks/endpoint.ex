defmodule Sapphire.Mocks.Endpoint do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sapphire.Mocks.Project

  schema "endpoints" do
    field :name, :string
    belongs_to :project, Project
    timestamps()
  end

  @doc false
  def changeset(endpoint, attrs) do
    endpoint
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
