defmodule Isafe.PageController do
  use Isafe.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
