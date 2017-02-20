defmodule Mobileapi.MobileapiControllerTest do
  use Mobileapi.ConnCase

  alias Mobileapi.Mobileapi
  @valid_attrs %{bio: "some content", email: "some content", name: "some content", number_of_pets: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mobileapi_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing mobileapi"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mobileapi_path(conn, :new)
    assert html_response(conn, 200) =~ "New mobileapi"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mobileapi_path(conn, :create), mobileapi: @valid_attrs
    assert redirected_to(conn) == mobileapi_path(conn, :index)
    assert Repo.get_by(Mobileapi, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mobileapi_path(conn, :create), mobileapi: @invalid_attrs
    assert html_response(conn, 200) =~ "New mobileapi"
  end

  test "shows chosen resource", %{conn: conn} do
    mobileapi = Repo.insert! %Mobileapi{}
    conn = get conn, mobileapi_path(conn, :show, mobileapi)
    assert html_response(conn, 200) =~ "Show mobileapi"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mobileapi_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mobileapi = Repo.insert! %Mobileapi{}
    conn = get conn, mobileapi_path(conn, :edit, mobileapi)
    assert html_response(conn, 200) =~ "Edit mobileapi"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mobileapi = Repo.insert! %Mobileapi{}
    conn = put conn, mobileapi_path(conn, :update, mobileapi), mobileapi: @valid_attrs
    assert redirected_to(conn) == mobileapi_path(conn, :show, mobileapi)
    assert Repo.get_by(Mobileapi, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mobileapi = Repo.insert! %Mobileapi{}
    conn = put conn, mobileapi_path(conn, :update, mobileapi), mobileapi: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mobileapi"
  end

  test "deletes chosen resource", %{conn: conn} do
    mobileapi = Repo.insert! %Mobileapi{}
    conn = delete conn, mobileapi_path(conn, :delete, mobileapi)
    assert redirected_to(conn) == mobileapi_path(conn, :index)
    refute Repo.get(Mobileapi, mobileapi.id)
  end
end
