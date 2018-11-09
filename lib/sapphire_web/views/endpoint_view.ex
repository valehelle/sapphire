defmodule SapphireWeb.EndpointView do
  use SapphireWeb, :view

  def getAPIPath(conn, project_id) do
    cur_uri = SapphireWeb.Endpoint.struct_url()
    base_url = %URI{cur_uri | scheme: "https" , port: nil}
    api_path = endpoint_path(conn, :get_api, project_id, [])
    path = SapphireWeb.Router.Helpers.url(base_url) <> api_path
  end
end
