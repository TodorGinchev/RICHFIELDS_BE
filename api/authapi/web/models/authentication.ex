defmodule Authapi.Authentication do
  use Authapi.Web, :model

  schema "authentication" do
    field :nickname, :string
    field :email, :string
    field :password, :string
    field :birthdate, Ecto.DateTime
    field :height, :float
    field :weight, :float
    field :groupid, :integer
    field :gender, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nickname, :email, :password, :birthdate, :height, :weight, :groupid, :gender])
    |> validate_required([:nickname, :email, :password, :birthdate, :height, :weight, :groupid, :gender])
  end
end
