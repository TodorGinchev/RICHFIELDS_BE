defmodule PreciousAppApi.AutoPaRawView do
  use PreciousAppApi.Web, :view

  def render("index.json", %{auto_pa_raw: auto_pa_raw}) do
    %{data: render_many(auto_pa_raw, PreciousAppApi.AutoPaRawView, "auto_pa_raw.json")}
  end

  def render("show.json", %{auto_pa_raw: auto_pa_raw}) do
    %{data: render_one(auto_pa_raw, PreciousAppApi.AutoPaRawView, "auto_pa_raw.json")}
  end

  def render("auto_pa_raw.json", %{auto_pa_raw: auto_pa_raw}) do
    %{id: auto_pa_raw.id,
      timestamp: auto_pa_raw.timestamp,
      usr_id: auto_pa_raw.usr_id,
      pa_type: auto_pa_raw.pa_type}
  end
end
