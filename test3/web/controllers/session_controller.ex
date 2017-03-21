defmodule Test3.SessionController do  
  use Test3.Web, :controller

  alias Test3.User

  def login(conn, %{"user" => user_params}) do
    if user = Repo.get_by(User, email: user_params["email"]) do

      token = User.generate_token(user)

      conn
      |> put_status(200)
      |> render(Test3.SessionView, "session.json", token: token)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Test3.SessionView, "error.json", message: "Nope")
    end
  end
end  
