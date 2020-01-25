defmodule BleacherReportWeb.UserController do
  use BleacherReportWeb, :controller

  alias BleacherReport.{Accounts, Function}

  # action_fallback BleacherReportWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()

    render(conn, "index.json", users: users)
  end

  def create_user(conn, user_params) do
    attr = Map.merge(user_params, %{id: Function.rand_string(30)})
    user = Accounts.create_user(attr)
    render(conn, "create.json", user: user)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user_by(id)
    render(conn, "show.json", user: user)
  end


end
