defmodule BleacherReportWeb.ContentView do
  use BleacherReportWeb, :view
  alias BleacherReportWeb.ContentView

  def render("index.json", %{contents: contents}) do
    %{data: render_many(contents, ContentView, "content.json")}
  end

  def render("show.json", %{content: content}) do
    %{data: render_one(content, ContentView, "content.json")}
  end

  def render("create.json", %{content: content}) do
    %{message: "Content added succefully", data: render_one(content, ContentView, "content.json")}
  end

  def render("content.json", %{content: content}) do
    %{
      id: content.id,
      user_id: content.user_id,
      title: content.title,
      body: content.body
    }
  end
end
