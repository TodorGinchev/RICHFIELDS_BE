defmodule Smartphoneapi.Usage do
  use Smartphoneapi.Web, :model

  schema "usage" do
    field :userid, :integer
    field :startedate, Ecto.DateTime
    field :duration, :string
    field :activity, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:userid, :startedate, :duration, :activity])
    |> validate_required([:userid, :startedate, :duration, :activity])
  end
end
