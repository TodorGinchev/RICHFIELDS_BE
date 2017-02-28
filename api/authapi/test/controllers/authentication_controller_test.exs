defmodule Authapi.AuthenticationControllerTest do
  use Authapi.ConnCase

  alias Authapi.Authentication
  @valid_attrs %{birthdate: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, email: "some content", gender: true, groupid: 42, height: "120.5", nickname: "some content", password: "some content", weight: "120.5"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, authentication_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    authentication = Repo.insert! %Authentication{}
    conn = get conn, authentication_path(conn, :show, authentication)
    assert json_response(conn, 200)["data"] == %{"id" => authentication.id,
      "nickname" => authentication.nickname,
      "email" => authentication.email,
      "password" => authentication.password,
      "birthdate" => authentication.birthdate,
      "height" => authentication.height,
      "weight" => authentication.weight,
      "groupid" => authentication.groupid,
      "gender" => authentication.gender}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, authentication_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, authentication_path(conn, :create), authentication: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Authentication, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, authentication_path(conn, :create), authentication: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    authentication = Repo.insert! %Authentication{}
    conn = put conn, authentication_path(conn, :update, authentication), authentication: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Authentication, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    authentication = Repo.insert! %Authentication{}
    conn = put conn, authentication_path(conn, :update, authentication), authentication: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    authentication = Repo.insert! %Authentication{}
    conn = delete conn, authentication_path(conn, :delete, authentication)
    assert response(conn, 204)
    refute Repo.get(Authentication, authentication.id)
  end
end
