defmodule BleacherReportWeb.UserController do
  use BleacherReportWeb, :controller

  alias BleacherReport.Accounts

  # action_fallback BleacherReportWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()

    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user_by(id)
    render(conn, "show.json", user: user)
  end


end
