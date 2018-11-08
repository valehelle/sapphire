defmodule SapphireWeb.EndpointView do
  use SapphireWeb, :view

  def getBaseURI(conn, project_id) do
    cur_uri = SapphireWeb.Endpoint.struct_url()
    api_path = endpoint_path(conn, :get_api, project_id, [])
    path = SapphireWeb.Router.Helpers.url(%URI{cur_uri | scheme: "https"}) <> api_path
  end
end
