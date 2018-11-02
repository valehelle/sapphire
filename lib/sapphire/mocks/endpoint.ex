defmodule Sapphire.Mocks.Endpoint do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sapphire.Mocks.Project
  schema "endpoints" do
    field :name, :string
    field :url, :string
    field :type, :string
    field :delay, :string
    field :body, :string
    field :status_code, :integer

    belongs_to :project, Project

    timestamps()
  end

  @doc false
  def changeset(endpoint, attrs) do
    endpoint
    |> cast(attrs, [:name, :url, :type, :delay, :body, :status_code])
    |> validate_required([:name])
  end
end
