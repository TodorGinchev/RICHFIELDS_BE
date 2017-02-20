defmodule HelloPhoenix.Postsql do
  use HelloPhoenix.Web, :model

  schema "postsqluser" do
    field :name, :string
    field :email, :string
    field :gender, :boolean, default: false
    field :birthyear, :integer
    field :nickname, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :gender, :birthyear, :nickname])
    |> validate_required([:name, :email, :gender, :birthyear, :nickname])
  end
end
