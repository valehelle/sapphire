defmodule SapphireWeb.EndpointController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Endpoint
  alias Sapphire.Mocks
  alias Sapphire.Mocks.Config

  def index(conn, _params) do
    endpoints = Mocks.list_endpoints()
    render conn, "index.html", endpoints: endpoints
  end
  def new(conn, _params) do
    changeset = Mocks.change_endpoint(%Endpoint{configs: [%Config{}]})
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"endpoint" => endpoint}) do
    case Mocks.create_endpoint(endpoint) do
      {:ok, endpoint} -> redirect(conn, to: endpoint_path(conn, :index, 1))
      {:error, error} -> 
      IO.inspect error
      render conn, "new.html", changeset: error
    end
  end
end
