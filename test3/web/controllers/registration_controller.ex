defmodule Test3.RegistrationController do  
  use Test3.Web, :controller

  alias Test3.User

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Test3.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Test3.ChangesetView, "error.json", changeset: changeset)
    end
  end
end  
