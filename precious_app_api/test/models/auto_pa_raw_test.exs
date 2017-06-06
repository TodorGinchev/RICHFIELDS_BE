defmodule PreciousAppApi.AutoPaRawTest do
  use PreciousAppApi.ModelCase

  alias PreciousAppApi.AutoPaRaw

  @valid_attrs %{pa_type: 42, timestamp: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, usr_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AutoPaRaw.changeset(%AutoPaRaw{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AutoPaRaw.changeset(%AutoPaRaw{}, @invalid_attrs)
    refute changeset.valid?
  end
end
