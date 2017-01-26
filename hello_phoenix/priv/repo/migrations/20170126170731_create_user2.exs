defmodule HelloPhoenix.Repo.Migrations.CreateUser2 do
  use Ecto.Migration

  def change do
    create table(:users2) do
      add :name, :string
      add :email, :string
      add :gender, :string
      add :year_of_birth, :integer
      add :group_id, :integer

      timestamps()
    end

  end
end
