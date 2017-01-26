defmodule HelloPhoenix.User2Test do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.User2

  @valid_attrs %{email: "some content", gender: "some content", group_id: 42, name: "some content", year_of_birth: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User2.changeset(%User2{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User2.changeset(%User2{}, @invalid_attrs)
    refute changeset.valid?
  end
end
