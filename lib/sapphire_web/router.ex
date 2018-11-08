defmodule SapphireWeb.Router do
  use SapphireWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug Sapphire.Accounts.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated, error_handler: SapphireWeb.UserController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SapphireWeb do
  pipe_through [:browser, :auth] # Use the default browser stack
  get "/", PageController, :index
  get "/users/sign_up", UserController, :register
  post "/users/sign_up", UserController, :register_user
  get "/users/sign_in", UserController, :index
  post "/users/sign_in", UserController, :login
  post "/users/sign_out", UserController, :logout
  end

  scope "/", SapphireWeb do
    pipe_through [:browser, :auth, :ensure_auth]
    get "/project", ProjectController, :index
    post "/project", ProjectController, :create
    get "/project/new", ProjectController, :new
    get "/project/:project_id", ProjectController, :show
    
    
    
    get "/project/:project_id/endpoint", EndpointController, :index
    get "/project/:project_id/endpoint/new", EndpointController, :new
    post "/project/:project_id/endpoint", EndpointController, :create
    get "/project/:project_id/endpoint/:endpoint_id", EndpointController, :show
    get "/project/:project_id/endpoint/:endpoint_id/edit", EndpointController, :edit
    put "/project/:project_id/endpoint/:endpoint_id/edit", EndpointController, :update

    get "/project/:project_id/api/*routes", EndpointController, :get_api
    post "/project/:project_id/api/*routes", EndpointController, :get_api
    put "/project/:project_id/api/*routes", EndpointController, :get_api
    delete "/project/:project_id/api/*routes", EndpointController, :get_api
  end
  # Other scopes may use custom stacks.
  # scope "/api", SapphireWeb do
  #   pipe_through :api
  # end
end
