defmodule Smartphoneapi.UsageController do
  use Smartphoneapi.Web, :controller

  alias Smartphoneapi.Usage

  def index(conn, _params) do
    usage = Repo.all(Usage)
    render(conn, "index.json", usage: usage)
  end

  def create(conn, %{"usage" => usage_params}) do
    changeset = Usage.changeset(%Usage{}, usage_params)

    case Repo.insert(changeset) do
      {:ok, usage} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", usage_path(conn, :show, usage))
        |> render("show.json", usage: usage)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Smartphoneapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    usage = Repo.get!(Usage, id)
    render(conn, "show.json", usage: usage)
  end

  def update(conn, %{"id" => id, "usage" => usage_params}) do
    usage = Repo.get!(Usage, id)
    changeset = Usage.changeset(usage, usage_params)

    case Repo.update(changeset) do
      {:ok, usage} ->
        render(conn, "show.json", usage: usage)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Smartphoneapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    usage = Repo.get!(Usage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(usage)

    send_resp(conn, :no_content, "")
  end
end
