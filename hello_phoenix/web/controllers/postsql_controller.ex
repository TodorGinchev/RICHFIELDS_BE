defmodule HelloPhoenix.PostsqlController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Postsql

  def index(conn, _params) do
    postsqluser = Repo.all(Postsql)
    render(conn, "index.html", postsqluser: postsqluser)
  end

  def new(conn, _params) do
    changeset = Postsql.changeset(%Postsql{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"postsql" => postsql_params}) do
    changeset = Postsql.changeset(%Postsql{}, postsql_params)

    case Repo.insert(changeset) do
      {:ok, _postsql} ->
        conn
        |> put_flash(:info, "Postsql created successfully.")
        |> redirect(to: postsql_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    postsql = Repo.get!(Postsql, id)
    render(conn, "show.html", postsql: postsql)
  end

  def edit(conn, %{"id" => id}) do
    postsql = Repo.get!(Postsql, id)
    changeset = Postsql.changeset(postsql)
    render(conn, "edit.html", postsql: postsql, changeset: changeset)
  end

  def update(conn, %{"id" => id, "postsql" => postsql_params}) do
    postsql = Repo.get!(Postsql, id)
    changeset = Postsql.changeset(postsql, postsql_params)

    case Repo.update(changeset) do
      {:ok, postsql} ->
        conn
        |> put_flash(:info, "Postsql updated successfully.")
        |> redirect(to: postsql_path(conn, :show, postsql))
      {:error, changeset} ->
        render(conn, "edit.html", postsql: postsql, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    postsql = Repo.get!(Postsql, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(postsql)

    conn
    |> put_flash(:info, "Postsql deleted successfully.")
    |> redirect(to: postsql_path(conn, :index))
  end
end
