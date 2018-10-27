defmodule SapphireWeb.EndpointController do
  use SapphireWeb, :controller

  alias Sapphire.Mocks.Project
  alias Sapphire.Mocks

  def index(conn, _params) do
    render conn, "index.html"
  end
  def new(conn, _params) do
    render conn, "index.html"
  end
  def create(conn, %{"project" => project}) do
    render conn, "index.html"
  end
end
