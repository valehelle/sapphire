defmodule SapphireWeb.EndpointController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Endpoint
  alias Sapphire.Mocks

  def index(conn, %{"project_id" => project_id}) do
    user = Guardian.Plug.current_resource(conn)
    endpoints = Mocks.list_endpoints(user.id, project_id)
    project = Mocks.get_project(user.id, project_id)
    render conn, "index.html", endpoints: endpoints, project: project
  end
  def new(conn, %{"project_id" => project_id}) do
    changeset = Mocks.change_endpoint(%Endpoint{})
    render conn, "new.html", changeset: changeset, project_id: project_id
  end
  
  def show(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    endpoint = Mocks.get_endpoint(user.id, params)
    render conn, "show.html", endpoint: endpoint
  end
  def create(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    case Mocks.create_endpoint(user.id, params) do
      {:ok, endpoint} -> redirect(conn, to: endpoint_path(conn, :index, endpoint.project_id))
      {:error, error} -> render conn, "new.html", changeset: error, project_id: Map.get(params, "project_id")
    end
  end
  def get_api(conn, params) do
    response = Mocks.get_endpoint(params)
    |> get_body()
    |> Poison.decode!()

    json conn, response
  end



  defp get_body(endpoint) do 
    endpoint.body
  end
end
