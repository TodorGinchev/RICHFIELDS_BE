defmodule AppName.Router do
  use AppName.Web, :router  
  
  pipeline :api do  
    plug :accepts, ["json"]
  end

  scope "/api/" do  
    pipe_through :api
    resources "/user", AppName.UserController
    post "/auth", AppName.RegistrationController, :create
    get "/auth/login", AppName.SessionController, :login  
  end  
end
