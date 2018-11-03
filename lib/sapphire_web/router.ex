defmodule SapphireWeb.Router do
  use SapphireWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SapphireWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/project", ProjectController, :index
    get "/project/:project_id", ProjectController, :show
    get "/project/new", ProjectController, :new
    post "/project", ProjectController, :create
    
    get "/project/:project_id/endpoint", EndpointController, :index
    get "/project/:project_id/endpoint/new", EndpointController, :new
    post "/project/:project_id/endpoint", EndpointController, :create
    get "/project/:project_id/endpoint/:endpoint_id", EndpointController, :show

    get "/project/:project_id/api/*routes", EndpointController, :get_api
  end

  # Other scopes may use custom stacks.
  # scope "/api", SapphireWeb do
  #   pipe_through :api
  # end
end
