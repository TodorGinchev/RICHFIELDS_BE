defmodule HelloPhoenix.PostsqlTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Postsql

  @valid_attrs %{birthyear: 42, email: "some content", gender: true, name: "some content", nickname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Postsql.changeset(%Postsql{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Postsql.changeset(%Postsql{}, @invalid_attrs)
    refute changeset.valid?
  end
end
