defmodule BleacherReportWeb.ReactionController do
  use BleacherReportWeb, :controller

  alias BleacherReport.{Reports, Function}

 action_fallback BleacherReportWeb.FallbackController
def reactions(conn, _params) do
  reactions = Reports.get_reactions()
  render(conn, "index.json", reactions: reactions)
end

  def reaction(conn, reaction_params) do
    attr = Map.merge(reaction_params, %{id: Function.rand_string(30)})
    reaction = Reports.create_reaction(attr)
    render(conn, "show.json", reaction: reaction)
  end

  def reactioncounts(conn, %{"content_id" => id}) do
    case Reports.get_fire_reaction(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(BleacherReportWeb.ErrorView)
        |> render(:"404")
        _ ->
          reaction = %{
          count: %{fire: Reports.get_fire_reaction(id) |> Enum.count},
          content_id: id
        }
        render(conn, "count.json", reaction: reaction)
    end

  end

end
