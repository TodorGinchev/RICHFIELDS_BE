defmodule HelloPhoenix.User3ControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.User3
  @valid_attrs %{birthyear: 42, email: "some content", gender: true, name: "some content", nickname: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user3_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing postgresql"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user3_path(conn, :new)
    assert html_response(conn, 200) =~ "New user3"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user3_path(conn, :create), user3: @valid_attrs
    assert redirected_to(conn) == user3_path(conn, :index)
    assert Repo.get_by(User3, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user3_path(conn, :create), user3: @invalid_attrs
    assert html_response(conn, 200) =~ "New user3"
  end

  test "shows chosen resource", %{conn: conn} do
    user3 = Repo.insert! %User3{}
    conn = get conn, user3_path(conn, :show, user3)
    assert html_response(conn, 200) =~ "Show user3"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user3_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    user3 = Repo.insert! %User3{}
    conn = get conn, user3_path(conn, :edit, user3)
    assert html_response(conn, 200) =~ "Edit user3"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    user3 = Repo.insert! %User3{}
    conn = put conn, user3_path(conn, :update, user3), user3: @valid_attrs
    assert redirected_to(conn) == user3_path(conn, :show, user3)
    assert Repo.get_by(User3, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user3 = Repo.insert! %User3{}
    conn = put conn, user3_path(conn, :update, user3), user3: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit user3"
  end

  test "deletes chosen resource", %{conn: conn} do
    user3 = Repo.insert! %User3{}
    conn = delete conn, user3_path(conn, :delete, user3)
    assert redirected_to(conn) == user3_path(conn, :index)
    refute Repo.get(User3, user3.id)
  end
end
