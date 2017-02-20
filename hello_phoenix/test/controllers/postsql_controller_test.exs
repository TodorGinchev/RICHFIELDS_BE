defmodule HelloPhoenix.PostsqlControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Postsql
  @valid_attrs %{birthyear: 42, email: "some content", gender: true, name: "some content", nickname: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, postsql_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing postsqluser"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, postsql_path(conn, :new)
    assert html_response(conn, 200) =~ "New postsql"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, postsql_path(conn, :create), postsql: @valid_attrs
    assert redirected_to(conn) == postsql_path(conn, :index)
    assert Repo.get_by(Postsql, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, postsql_path(conn, :create), postsql: @invalid_attrs
    assert html_response(conn, 200) =~ "New postsql"
  end

  test "shows chosen resource", %{conn: conn} do
    postsql = Repo.insert! %Postsql{}
    conn = get conn, postsql_path(conn, :show, postsql)
    assert html_response(conn, 200) =~ "Show postsql"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, postsql_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    postsql = Repo.insert! %Postsql{}
    conn = get conn, postsql_path(conn, :edit, postsql)
    assert html_response(conn, 200) =~ "Edit postsql"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    postsql = Repo.insert! %Postsql{}
    conn = put conn, postsql_path(conn, :update, postsql), postsql: @valid_attrs
    assert redirected_to(conn) == postsql_path(conn, :show, postsql)
    assert Repo.get_by(Postsql, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    postsql = Repo.insert! %Postsql{}
    conn = put conn, postsql_path(conn, :update, postsql), postsql: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit postsql"
  end

  test "deletes chosen resource", %{conn: conn} do
    postsql = Repo.insert! %Postsql{}
    conn = delete conn, postsql_path(conn, :delete, postsql)
    assert redirected_to(conn) == postsql_path(conn, :index)
    refute Repo.get(Postsql, postsql.id)
  end
end
