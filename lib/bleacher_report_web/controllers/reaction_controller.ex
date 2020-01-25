defmodule BleacherReportWeb.ReactionController do
  use BleacherReportWeb, :controller

  alias BleacherReport.Reports
  alias BleacherReport.Reports.Reaction

  # action_fallback BleacherReportWeb.FallbackController

  def reaction(conn,
    %{
    "action" => action,
    "content_id" => content_id,
    "reaction_type" => reaction_type,
    "type" => type,
    "user_id" => user_id
  }) do
    mystr = %Reaction{
      id: "iiioo0998ghjbvv",
      user_id: user_id,
      content_id: content_id,
      type: type,
      action: action,
      reaction_type: reaction_type
      }
    Reports.create_reaction(mystr)
    reaction = mystr
    render(conn, "show.json", reaction: reaction)
  end

end
