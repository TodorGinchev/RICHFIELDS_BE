defmodule Smartphoneapi.Repo.Migrations.CreateUsage do
  use Ecto.Migration

  def change do
    create table(:usage) do
      add :userid, :integer
      add :startedate, :datetime
      add :duration, :string
      add :activity, :string

      timestamps()
    end

  end
end
