defmodule Sapphire.Mocks do
  @moduledoc """
  The Mocks context.
  """

  import Ecto.Query, warn: false
  alias Sapphire.Repo

  alias Sapphire.Mocks.Project
  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{source: %Project{}}

  """
  def change_project(%Project{} = project) do
    Project.changeset(project, %{})
  end

  alias Sapphire.Mocks.Endpoint

  @doc """
  Returns the list of endpoints.

  ## Examples

      iex> list_endpoints()
      [%Endpoint{}, ...]

  """
  def list_endpoints(%{"project_id" => project_id}) do
    query = from e in Endpoint, 
            where: e.project_id == ^project_id,
            order_by: e.inserted_at
    Repo.all(query)
  end

  @doc """
  Gets a single endpoint.

  Raises `Ecto.NoResultsError` if the Endpoint does not exist.

  ## Examples

      iex> get_endpoint!(123)
      %Endpoint{}

      iex> get_endpoint!(456)
      ** (Ecto.NoResultsError)

  """
  def get_endpoint!(id), do: Repo.get!(Endpoint, id)

  @doc """
  Creates a endpoint.

  ## Examples

      iex> create_endpoint(%{field: value})
      {:ok, %Endpoint{}}

      iex> create_endpoint(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def get_endpoint(%{"project_id" => project_id, "endpoint_id" => endpoint_id}) do
    Repo.get_by(Endpoint, id: endpoint_id)
  end

  def get_endpoint(%{"routes" => routes}) do
    url = Enum.join(routes, "/") 
    Repo.get_by(Endpoint, url: url)
  end

def get_endpoint(url) do
    Repo.get_by(Endpoint, url: url)
  end

  defp check_unique_url(attrs) do
    url = Map.get(attrs, "url")
    project_id = Map.get(attrs, "project_id")
    case get_endpoint(url) do
      nil -> Map.put(attrs, "url_is_unique", true)
      _   -> Map.put(attrs, "url_is_unique", false)
    end
  end

  def create_endpoint(params) do
    project_id = Map.get(params, "project_id")

    endpoint_attrs = Map.get(params, "endpoint")
    |> Map.put("status_code", 200)
    |> Map.put("project_id", project_id)
    |> check_unique_url()

    %Endpoint{}
    |> Endpoint.changeset(endpoint_attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a endpoint.

  ## Examples

      iex> update_endpoint(endpoint, %{field: new_value})
      {:ok, %Endpoint{}}

      iex> update_endpoint(endpoint, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_endpoint(%Endpoint{} = endpoint, attrs) do
    endpoint
    |> Endpoint.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Endpoint.

  ## Examples

      iex> delete_endpoint(endpoint)
      {:ok, %Endpoint{}}

      iex> delete_endpoint(endpoint)
      {:error, %Ecto.Changeset{}}

  """
  def delete_endpoint(%Endpoint{} = endpoint) do
    Repo.delete(endpoint)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking endpoint changes.

  ## Examples

      iex> change_endpoint(endpoint)
      %Ecto.Changeset{source: %Endpoint{}}

  """
  def change_endpoint(%Endpoint{} = endpoint) do
    Endpoint.changeset(endpoint, %{})
  end

  

  
end
