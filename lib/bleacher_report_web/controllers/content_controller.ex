defmodule BleacherReportWeb.ContentController do
  use BleacherReportWeb, :controller

  alias BleacherReport.{Reports, Function}

  # action_fallback BleacherReportWeb.FallbackController
def index(conn, _params) do
  contents = Reports.get_contents()
  render(conn, "index.json", contents: contents)
end

  def create_content(conn, content_params) do
    attr = Map.merge(content_params, %{id: Function.rand_string(30)})
    content = Reports.create_content(attr)
    render(conn, "create.json", content: content)
  end

end
