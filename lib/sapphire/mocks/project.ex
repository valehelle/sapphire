defmodule Sapphire.Mocks.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sapphire.Mocks.Endpoint

  schema "projects" do
    field :name, :string
    has_many :endpoints, Endpoint
    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
