defmodule BleacherReportWeb.ReactionController do
  use BleacherReportWeb, :controller

  alias BleacherReport.{Reports, Function}

  # action_fallback BleacherReportWeb.FallbackController
def reactions(conn, _params) do
  reactions = Reports.get_reactions()
  render(conn, "index.json", reactions: reactions)
end

  def reaction(conn, reaction_params) do
    attr = Map.merge(reaction_params, %{id: Function.rand_string(30)})
    reaction = Reports.create_reaction(attr)
    render(conn, "show.json", reaction: reaction)
  end

end
