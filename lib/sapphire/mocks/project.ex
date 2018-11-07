defmodule Sapphire.Mocks.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sapphire.Mocks.Endpoint

  schema "projects" do
    field :name, :string
    has_many :endpoints, Endpoint
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
