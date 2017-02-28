defmodule Smartphoneapi.UsageControllerTest do
  use Smartphoneapi.ConnCase

  alias Smartphoneapi.Usage
  @valid_attrs %{activity: "some content", duration: "some content", startedate: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, userid: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, usage_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    usage = Repo.insert! %Usage{}
    conn = get conn, usage_path(conn, :show, usage)
    assert json_response(conn, 200)["data"] == %{"id" => usage.id,
      "userid" => usage.userid,
      "startedate" => usage.startedate,
      "duration" => usage.duration,
      "activity" => usage.activity}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, usage_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, usage_path(conn, :create), usage: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Usage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, usage_path(conn, :create), usage: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    usage = Repo.insert! %Usage{}
    conn = put conn, usage_path(conn, :update, usage), usage: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Usage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    usage = Repo.insert! %Usage{}
    conn = put conn, usage_path(conn, :update, usage), usage: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    usage = Repo.insert! %Usage{}
    conn = delete conn, usage_path(conn, :delete, usage)
    assert response(conn, 204)
    refute Repo.get(Usage, usage.id)
  end
end
