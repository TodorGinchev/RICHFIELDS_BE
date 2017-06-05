defmodule PreciousAppApi.PageController do
  use PreciousAppApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
