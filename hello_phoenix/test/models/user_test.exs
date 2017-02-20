defmodule HelloPhoenix.UserTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.User

  @valid_attrs %{birthyear: 42, email: "some content", gender: true, name: "some content", nickname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
