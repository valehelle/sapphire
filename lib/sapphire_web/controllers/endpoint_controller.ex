defmodule SapphireWeb.EndpointController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Endpoint
  alias Sapphire.Mocks

  def index(conn, params) do
    endpoints = Mocks.list_endpoints(params)
    render conn, "index.html", endpoints: endpoints
  end
  def new(conn, _params) do
    changeset = Mocks.change_endpoint(%Endpoint{})
    render conn, "new.html", changeset: changeset
  end
  
  def show(conn, params) do
    endpoint = Mocks.get_endpoint(params)
    render conn, "show.html", endpoint: endpoint
  end
  def create(conn, params) do
    case Mocks.create_endpoint(params) do
      {:ok, endpoint} -> redirect(conn, to: endpoint_path(conn, :index, 1))
      {:error, error} -> render conn, "new.html", changeset: error
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
