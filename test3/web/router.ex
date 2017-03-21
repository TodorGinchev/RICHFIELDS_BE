defmodule Test3.Router do
  use Test3.Web, :router

pipeline :api do  
  plug :accepts, ["json"]
end




scope "/api/" do  
  pipe_through :api
  resources "/users", UserController

  post "/auth", RegistrationController, :create
  get "/auth/login", SessionController, :login  
end  

end
