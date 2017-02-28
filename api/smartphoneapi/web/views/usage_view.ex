defmodule Smartphoneapi.UsageView do
  use Smartphoneapi.Web, :view

  def render("index.json", %{usage: usage}) do
    %{data: render_many(usage, Smartphoneapi.UsageView, "usage.json")}
  end

  def render("show.json", %{usage: usage}) do
    %{data: render_one(usage, Smartphoneapi.UsageView, "usage.json")}
  end

  def render("usage.json", %{usage: usage}) do
    %{id: usage.id,
      userid: usage.userid,
      startedate: usage.startedate,
      duration: usage.duration,
      activity: usage.activity}
  end
end
