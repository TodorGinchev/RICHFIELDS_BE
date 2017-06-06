defmodule PreciousAppApi.AutoPaRawControllerTest do
  use PreciousAppApi.ConnCase

  alias PreciousAppApi.AutoPaRaw
  @valid_attrs %{pa_type: 42, timestamp: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, usr_id: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, auto_pa_raw_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    auto_pa_raw = Repo.insert! %AutoPaRaw{}
    conn = get conn, auto_pa_raw_path(conn, :show, auto_pa_raw)
    assert json_response(conn, 200)["data"] == %{"id" => auto_pa_raw.id,
      "timestamp" => auto_pa_raw.timestamp,
      "usr_id" => auto_pa_raw.usr_id,
      "pa_type" => auto_pa_raw.pa_type}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, auto_pa_raw_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, auto_pa_raw_path(conn, :create), auto_pa_raw: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(AutoPaRaw, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, auto_pa_raw_path(conn, :create), auto_pa_raw: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    auto_pa_raw = Repo.insert! %AutoPaRaw{}
    conn = put conn, auto_pa_raw_path(conn, :update, auto_pa_raw), auto_pa_raw: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(AutoPaRaw, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    auto_pa_raw = Repo.insert! %AutoPaRaw{}
    conn = put conn, auto_pa_raw_path(conn, :update, auto_pa_raw), auto_pa_raw: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    auto_pa_raw = Repo.insert! %AutoPaRaw{}
    conn = delete conn, auto_pa_raw_path(conn, :delete, auto_pa_raw)
    assert response(conn, 204)
    refute Repo.get(AutoPaRaw, auto_pa_raw.id)
  end
end
