defmodule Test3.UserView do
  use Test3.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Test3.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Test3.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password_hash: user.password_hash}
  end
end
