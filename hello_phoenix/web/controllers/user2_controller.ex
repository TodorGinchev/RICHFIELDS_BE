defmodule HelloPhoenix.User2Controller do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.User2

  def index(conn, _params) do
    users2 = Repo.all(User2)
    render(conn, "index.html", users2: users2)
  end

  def new(conn, _params) do
    changeset = User2.changeset(%User2{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user2" => user2_params}) do
    changeset = User2.changeset(%User2{}, user2_params)

    case Repo.insert(changeset) do
      {:ok, _user2} ->
        conn
        |> put_flash(:info, "User2 created successfully.")
        |> redirect(to: user2_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user2 = Repo.get!(User2, id)
    render(conn, "show.html", user2: user2)
  end

  def edit(conn, %{"id" => id}) do
    user2 = Repo.get!(User2, id)
    changeset = User2.changeset(user2)
    render(conn, "edit.html", user2: user2, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user2" => user2_params}) do
    user2 = Repo.get!(User2, id)
    changeset = User2.changeset(user2, user2_params)

    case Repo.update(changeset) do
      {:ok, user2} ->
        conn
        |> put_flash(:info, "User2 updated successfully.")
        |> redirect(to: user2_path(conn, :show, user2))
      {:error, changeset} ->
        render(conn, "edit.html", user2: user2, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user2 = Repo.get!(User2, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user2)

    conn
    |> put_flash(:info, "User2 deleted successfully.")
    |> redirect(to: user2_path(conn, :index))
  end
end
