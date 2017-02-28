defmodule Authapi.Router do
  use Authapi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    resources "/authapi/authentication", Authapi.AuthenticationController
  end
end
