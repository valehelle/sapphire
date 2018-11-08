defmodule SapphireWeb.ProjectController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Project
  alias Sapphire.Mocks

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    projects = Mocks.list_projects(user.id)
    render conn, "index.html", projects: projects
  end
  def show(conn, %{"project_id" => project_id}) do
    user = Guardian.Plug.current_resource(conn)
    project = Mocks.get_project(user.id, project_id)
    render conn, "show.html", project: project
  end
  def new(conn, _params) do
    changeset = Mocks.change_project(%Project{})
    user = Guardian.Plug.current_resource(conn)
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"project" => project}) do
    user = Guardian.Plug.current_resource(conn)
    case Mocks.create_project(user.id, project) do
      {:ok, project} -> redirect(conn, to: project_path(conn, :index))
      {:error, error} -> render conn, "new.html", changeset: error
    end
  end
end
