defmodule SapphireWeb.EndpointController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Endpoint
  alias Sapphire.Mocks

  def index(conn, _params) do
    endpoints = Mocks.list_endpoints()
    render conn, "index.html", endpoints: endpoints
  end
  def new(conn, _params) do
    changeset = Mocks.change_endpoint(%Endpoint{})
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"endpoint" => endpoint}) do
    case Mocks.create_endpoint(endpoint) do
      {:ok, endpoint} -> redirect(conn, to: endpoint_path(conn, :index, 1))
      {:error, error} -> render conn, "new.html", changeset: error
    end
  end
  def get_api(conn, %{"route" => route}) do
    response = Mocks.get_endpoint(route)
    |> get_body()
    |> Poison.decode!()

    json conn, response
  end



  defp get_body(endpoint) do 
    endpoint.body
  end
end
