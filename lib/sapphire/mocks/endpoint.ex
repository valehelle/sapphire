defmodule Sapphire.Mocks.Endpoint do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sapphire.Mocks.Project
  alias Sapphire.Mocks.Config
  schema "endpoints" do
    field :name, :string
    belongs_to :project, Project
    has_many :configs, Config
    timestamps()
  end

  @doc false
  def changeset(endpoint, attrs) do
    endpoint
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
