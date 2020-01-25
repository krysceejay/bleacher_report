defmodule BleacherReportWeb.UserController do
  use BleacherReportWeb, :controller

  alias BleacherReport.{Accounts, Reports}
  alias BleacherReport.Reports.Reaction

  # action_fallback BleacherReportWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()

    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user_by(id)
    render(conn, "show.json", user: user)
  end

  def reactioncounts(conn, %{"content_id" => id}) do
    user = Accounts.get_user_by(id)
    render(conn, "show.json", user: user)
  end

  def reaction(conn,
    %{
    "action" => action,
    "content_id" => content_id,
    "reaction_type" => reaction_type,
    "type" => type,
    "user_id" => user_id
  } = attrs) do
    mystr = %Reaction{
      id: "iiioo0998ghjbvv",
      user_id: user_id,
      content_id: content_id,
      type: type,
      action: action,
      reaction_type: reaction_type
      } 
    IO.puts "+++++++++++++++++"
    IO.inspect Reports.create_reaction(mystr)
    IO.puts "+++++++++++++++++"

  end




end
