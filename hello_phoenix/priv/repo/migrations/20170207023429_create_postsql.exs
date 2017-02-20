defmodule HelloPhoenix.Repo.Migrations.CreatePostsql do
  use Ecto.Migration

  def change do
    create table(:postsqluser) do
      add :name, :string
      add :email, :string
      add :gender, :boolean, default: false, null: false
      add :birthyear, :integer
      add :nickname, :string

      timestamps()
    end

  end
end
