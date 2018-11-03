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
    field :url_is_unique, :boolean, virtual: true
    belongs_to :project, Project

    timestamps()
  end

  @doc false
  def changeset(endpoint, attrs) do
    endpoint
    |> cast(attrs, [:name, :url, :type, :delay, :body, :status_code, :project_id, :url_is_unique])
    |> validate_required([:name])
    |> validate_unique_url()
  end

  defp validate_unique_url(changeset) do 
    changeset = validate_change changeset, :url_is_unique, fn :url_is_unique, url_is_unique  ->
      if url_is_unique do
        []
      else
        [url: "url must be unique"]
      end

    end
  end

end
