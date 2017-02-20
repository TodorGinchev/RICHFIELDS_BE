defmodule HelloPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:postgresql) do
      add :name, :string
      add :email, :string
      add :gender, :boolean, default: false, null: false
      add :birthyear, :integer
      add :nickname, :string

      timestamps()
    end

  end
end
