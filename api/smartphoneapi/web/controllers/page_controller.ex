defmodule Smartphoneapi.PageController do
  use Smartphoneapi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
