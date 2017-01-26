defmodule HelloPhoenix.User2ControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.User2
  @valid_attrs %{email: "some content", gender: "some content", group_id: 42, name: "some content", year_of_birth: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user2_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing users2"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user2_path(conn, :new)
    assert html_response(conn, 200) =~ "New user2"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user2_path(conn, :create), user2: @valid_attrs
    assert redirected_to(conn) == user2_path(conn, :index)
    assert Repo.get_by(User2, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user2_path(conn, :create), user2: @invalid_attrs
    assert html_response(conn, 200) =~ "New user2"
  end

  test "shows chosen resource", %{conn: conn} do
    user2 = Repo.insert! %User2{}
    conn = get conn, user2_path(conn, :show, user2)
    assert html_response(conn, 200) =~ "Show user2"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user2_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    user2 = Repo.insert! %User2{}
    conn = get conn, user2_path(conn, :edit, user2)
    assert html_response(conn, 200) =~ "Edit user2"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    user2 = Repo.insert! %User2{}
    conn = put conn, user2_path(conn, :update, user2), user2: @valid_attrs
    assert redirected_to(conn) == user2_path(conn, :show, user2)
    assert Repo.get_by(User2, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user2 = Repo.insert! %User2{}
    conn = put conn, user2_path(conn, :update, user2), user2: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit user2"
  end

  test "deletes chosen resource", %{conn: conn} do
    user2 = Repo.insert! %User2{}
    conn = delete conn, user2_path(conn, :delete, user2)
    assert redirected_to(conn) == user2_path(conn, :index)
    refute Repo.get(User2, user2.id)
  end
end
