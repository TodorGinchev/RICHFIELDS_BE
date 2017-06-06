defmodule PreciousAppApi.Repo.Migrations.CreateAutoPaRaw do
  use Ecto.Migration

  def change do
    create table(:auto_pa_raw, primary_key: false) do
      add :timestamp, :datetime, primary_key: true
      add :usr_id, :integer, primary_key: true
      add :pa_type, :integer

     #timestamps()
    end

  end
end
