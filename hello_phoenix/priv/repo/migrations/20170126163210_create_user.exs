defmodule HelloPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :registered, :long
      add :year_of_birth, :integer
      add :gender, :boolean

      timestamps()
    end

  end
end
