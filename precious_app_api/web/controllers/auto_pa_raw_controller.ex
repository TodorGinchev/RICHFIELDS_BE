defmodule PreciousAppApi.AutoPaRawController do
  use PreciousAppApi.Web, :controller

  alias PreciousAppApi.AutoPaRaw

  def index(conn, _params) do
    auto_pa_raw = Repo.all(AutoPaRaw)
    render(conn, "index.json", auto_pa_raw: auto_pa_raw)
  end

  def create(conn, %{"auto_pa_raw" => auto_pa_raw_params}) do
    changeset = AutoPaRaw.changeset(%AutoPaRaw{}, auto_pa_raw_params)

    case Repo.insert(changeset) do
      {:ok, auto_pa_raw} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", auto_pa_raw_path(conn, :show, auto_pa_raw))
        |> render("show.json", auto_pa_raw: auto_pa_raw)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PreciousAppApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    auto_pa_raw = Repo.get!(AutoPaRaw, id)
    render(conn, "show.json", auto_pa_raw: auto_pa_raw)
  end

  def update(conn, %{"id" => id, "auto_pa_raw" => auto_pa_raw_params}) do
    auto_pa_raw = Repo.get!(AutoPaRaw, id)
    changeset = AutoPaRaw.changeset(auto_pa_raw, auto_pa_raw_params)

    case Repo.update(changeset) do
      {:ok, auto_pa_raw} ->
        render(conn, "show.json", auto_pa_raw: auto_pa_raw)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PreciousAppApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    auto_pa_raw = Repo.get!(AutoPaRaw, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(auto_pa_raw)

    send_resp(conn, :no_content, "")
  end
end
