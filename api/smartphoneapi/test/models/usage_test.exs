defmodule Smartphoneapi.UsageTest do
  use Smartphoneapi.ModelCase

  alias Smartphoneapi.Usage

  @valid_attrs %{activity: "some content", duration: "some content", startedate: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, userid: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Usage.changeset(%Usage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Usage.changeset(%Usage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
