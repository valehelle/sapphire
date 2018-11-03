defmodule SapphireWeb.ProjectController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Project
  alias Sapphire.Mocks

  def index(conn, _params) do
    projects = Mocks.list_projects()
    render conn, "index.html", projects: projects
  end
  def show(conn, %{"project_id" => project_id}) do
    project = Mocks.get_project(project_id)
    render conn, "show.html", project: project
  end
  def new(conn, _params) do
    changeset = Mocks.change_project(%Project{})
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"project" => project}) do
    case Mocks.create_project(project) do
      {:ok, project} -> redirect(conn, to: project_path(conn, :index))
      {:error, error} -> render conn, "new.html", changeset: error
    end
  end
end
