defmodule Mobileapi.MobileapiTest do
  use Mobileapi.ModelCase

  alias Mobileapi.Mobileapi

  @valid_attrs %{bio: "some content", email: "some content", name: "some content", number_of_pets: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mobileapi.changeset(%Mobileapi{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mobileapi.changeset(%Mobileapi{}, @invalid_attrs)
    refute changeset.valid?
  end
end
