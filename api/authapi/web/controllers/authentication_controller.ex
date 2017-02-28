defmodule Authapi.AuthenticationController do
  use Authapi.Web, :controller

  alias Authapi.Authentication

  def index(conn, _params) do
    authentication = Repo.all(Authentication)
    render(conn, "index.json", authentication: authentication)
  end

  def create(conn, %{"authentication" => authentication_params}) do
    changeset = Authentication.changeset(%Authentication{}, authentication_params)

    case Repo.insert(changeset) do
      {:ok, authentication} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", authentication_path(conn, :show, authentication))
        |> render("show.json", authentication: authentication)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Authapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    authentication = Repo.get!(Authentication, id)
    render(conn, "show.json", authentication: authentication)
  end

  def update(conn, %{"id" => id, "authentication" => authentication_params}) do
    authentication = Repo.get!(Authentication, id)
    changeset = Authentication.changeset(authentication, authentication_params)

    case Repo.update(changeset) do
      {:ok, authentication} ->
        render(conn, "show.json", authentication: authentication)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Authapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    authentication = Repo.get!(Authentication, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(authentication)

    send_resp(conn, :no_content, "")
  end
end
