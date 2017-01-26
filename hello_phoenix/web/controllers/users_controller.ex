
defmodule HelloPhoenix.UsersController do
  require Logger

  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

#  def show(conn, %{"messenger" => messenger}) do
#   render conn, "show.html", messenger: messenger
#end
  

  def create(conn, params) do
    Logger.info "api/users POST received"
    #json(conn, %{body: params})
    json(conn, params)
    

  end

  def get(conn,%{"user"=>user}) do
    
  end

end

