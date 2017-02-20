defmodule Mobileapi.MobileapiController do
  use Mobileapi.Web, :controller

  alias Mobileapi.Mobileapi

  def index(conn, _params) do
    mobileapi = Repo.all(Mobileapi)
    render(conn, "index.html", mobileapi: mobileapi)
  end

  def new(conn, _params) do
    changeset = Mobileapi.changeset(%Mobileapi{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mobileapi" => mobileapi_params}) do
    changeset = Mobileapi.changeset(%Mobileapi{}, mobileapi_params)

    case Repo.insert(changeset) do
      {:ok, _mobileapi} ->
        conn
        |> put_flash(:info, "Mobileapi created successfully.")
        |> redirect(to: mobileapi_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mobileapi = Repo.get!(Mobileapi, id)
    render(conn, "show.html", mobileapi: mobileapi)
  end

  def edit(conn, %{"id" => id}) do
    mobileapi = Repo.get!(Mobileapi, id)
    changeset = Mobileapi.changeset(mobileapi)
    render(conn, "edit.html", mobileapi: mobileapi, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mobileapi" => mobileapi_params}) do
    mobileapi = Repo.get!(Mobileapi, id)
    changeset = Mobileapi.changeset(mobileapi, mobileapi_params)

    case Repo.update(changeset) do
      {:ok, mobileapi} ->
        conn
        |> put_flash(:info, "Mobileapi updated successfully.")
        |> redirect(to: mobileapi_path(conn, :show, mobileapi))
      {:error, changeset} ->
        render(conn, "edit.html", mobileapi: mobileapi, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mobileapi = Repo.get!(Mobileapi, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mobileapi)

    conn
    |> put_flash(:info, "Mobileapi deleted successfully.")
    |> redirect(to: mobileapi_path(conn, :index))
  end
end
