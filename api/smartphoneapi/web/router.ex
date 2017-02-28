defmodule Smartphoneapi.Router do
  use Smartphoneapi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    resources "/smartphoneapi/usage", Smartphoneapi.UsageController
  end
end
