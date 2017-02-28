defmodule Authapi.AuthenticationTest do
  use Authapi.ModelCase

  alias Authapi.Authentication

  @valid_attrs %{birthdate: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, email: "some content", gender: true, groupid: 42, height: "120.5", nickname: "some content", password: "some content", weight: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Authentication.changeset(%Authentication{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Authentication.changeset(%Authentication{}, @invalid_attrs)
    refute changeset.valid?
  end
end
