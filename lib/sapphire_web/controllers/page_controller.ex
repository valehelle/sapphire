defmodule SapphireWeb.PageController do
  use SapphireWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
