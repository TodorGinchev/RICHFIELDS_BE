defmodule Authapi.Repo.Migrations.CreateAuthentication do
  use Ecto.Migration

  def change do
    create table(:authentication) do
      add :nickname, :string
      add :email, :string
      add :password, :string
      add :birthdate, :datetime
      add :height, :float
      add :weight, :float
      add :groupid, :integer
      add :gender, :boolean, default: false, null: false

      timestamps()
    end

  end
end
