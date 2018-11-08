defmodule Sapphire.Mocks.Endpoint do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sapphire.Mocks.Project
  alias Sapphire.Accounts.User
  schema "endpoints" do
    field :name, :string
    field :url, :string
    field :delay, :string
    field :body, :string
    field :url_is_unique, :boolean, virtual: true
    field :is_user_authorise, :boolean, virtual: true
    belongs_to :project, Project
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(endpoint, attrs) do
    endpoint
    |> cast(attrs, [:name, :url, :delay, :body, :project_id, :url_is_unique, :user_id, :is_user_authorise])
    |> validate_required([:name, :url, :delay, :body, :project_id, :url_is_unique, :user_id, :is_user_authorise])
    |> validate_unique_url()
    |> validate_json_format()
    |> validate_user_authority()
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
  defp validate_user_authority(changeset) do 
    changeset = validate_change changeset, :is_user_authorise, fn :is_user_authorise, is_user_authorise  ->
      if is_user_authorise do
        []
      else
        [name: "You are not authorize"]
      end

    end
  end
  defp validate_json_format(changeset) do 
    changeset = validate_change changeset, :body, fn :body, body  ->
      if is_json(body) do
        []
      else
        [body: "not in json format"]
      end
    end
  end

  defp is_json(str) do
    try do 
      Poison.Parser.parse!(str)
      true
    rescue
      Poison.SyntaxError -> false
    end
  end

end
