defmodule TodoApi.Router do
  use TodoApi.Web, :router

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

  scope "/", TodoApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", TodoApi do
  pipe_through :api

  resources "/todos", TodoController, except: [:new, :edit]
    resources "/users", UserController, only: [:create]
  end


end
