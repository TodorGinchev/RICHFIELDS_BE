defmodule Authapi.AuthenticationView do
  use Authapi.Web, :view

  def render("index.json", %{authentication: authentication}) do
    %{data: render_many(authentication, Authapi.AuthenticationView, "authentication.json")}
  end

  def render("show.json", %{authentication: authentication}) do
    %{data: render_one(authentication, Authapi.AuthenticationView, "authentication.json")}
  end

  def render("authentication.json", %{authentication: authentication}) do
    %{id: authentication.id,
      nickname: authentication.nickname,
      email: authentication.email,
      password: authentication.password,
      birthdate: authentication.birthdate,
      height: authentication.height,
      weight: authentication.weight,
      groupid: authentication.groupid,
      gender: authentication.gender}
  end
end
