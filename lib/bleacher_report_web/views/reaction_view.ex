defmodule BleacherReportWeb.ReactionView do
  use BleacherReportWeb, :view
  alias BleacherReportWeb.ReactionView

  def render("index.json", %{reactions: reactions}) do
    %{data: render_many(reactions, ReactionView, "user.json")}
  end

  def render("show.json", %{reaction: reaction}) do
    %{message: "successful", data: render_one(reaction, ReactionView, "user.json")}
  end

  def render("user.json", %{reaction: reaction}) do
    %{
      id: reaction.id,
      action: reaction.action,
      content_id: reaction.content_id,
      user_id: reaction.user_id,
      reaction_type: reaction.reaction_type,
      type: reaction.type
    }
  end
end
