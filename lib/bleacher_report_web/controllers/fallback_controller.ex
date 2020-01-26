defmodule BleacherReportWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use BleacherReportWeb, :controller

  # def call(conn, {:error, reason}) do
  #   conn
  #   |> put_status(:unprocessable_entity)
  #   |> put_view(BleacherReportWeb.ChangesetView)
  #   |> render("error.json", reason: reason)
  # end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(BleacherReportWeb.ErrorView)
    |> render(:"404")
  end
end
