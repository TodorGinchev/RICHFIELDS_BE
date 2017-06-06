defmodule PreciousAppApi.AutoPaRaw do
  use PreciousAppApi.Web, :model

  @primary_key false
  schema "auto_pa_raw" do
    field :timestamp, Ecto.DateTime, primary_key: true
    field :usr_id, :integer, primary_key: true
    field :pa_type, :integer

    #timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:timestamp, :usr_id, :pa_type])
    |> validate_required([:timestamp, :usr_id, :pa_type])
  end
end
