defmodule PreciousAppApi.Router do
  use PreciousAppApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
 #   plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

#  scope "/", PreciousAppApi do
#    pipe_through :browser # Use the default browser stack

#    get "/", PageController, :index
#  end

  # Other scopes may use custom stacks.
  scope "/precious_app", PreciousAppApi do
    pipe_through :api
    resources "/pa_sensors", PasensorController
    resources "/auto_pa_raw", AutoPaRawController
   
  end
end
