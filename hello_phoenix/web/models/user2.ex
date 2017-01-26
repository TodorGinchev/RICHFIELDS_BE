defmodule HelloPhoenix.User2 do
  use HelloPhoenix.Web, :model

  schema "users2" do
    field :name, :string
    field :email, :string
    field :gender, :string
    field :year_of_birth, :integer
    field :group_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :gender, :year_of_birth, :group_id])
    |> validate_required([:name, :email, :gender, :year_of_birth, :group_id])
  end
end
