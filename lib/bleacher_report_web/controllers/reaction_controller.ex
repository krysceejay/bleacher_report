defmodule BleacherReportWeb.ReactionController do
  use BleacherReportWeb, :controller

  alias BleacherReport.Reports

  # action_fallback BleacherReportWeb.FallbackController
def reactions(conn, _params) do
  reactions = Reports.get_reactions()
  render(conn, "index.json", reactions: reactions)
end

  def reaction(conn, params) do
    attr = Map.merge(params, %{id: "jhgfdsfgchvjbnjhjvgcf"})
    reaction = Reports.create_reaction(attr)
    render(conn, "show.json", reaction: reaction)
  end

end
