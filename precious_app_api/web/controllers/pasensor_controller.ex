defmodule PreciousAppApi.PasensorController do
  use PreciousAppApi.Web, :controller
  use HTTPotion.Base
  require Logger


def create(conn,pa_params) do
  Logger.info "PasensorController create"
  IO.inspect pa_params
  #changeset = Test.changeset(%Test{}, test_params)


  defmodule Person do
    @derive [Poison.Encoder]
    defstruct [:name, :age]
  end



  json(conn,pa_params)
  json(conn,~s({"name": "Devin Torres", "age": 27}))


end

end


