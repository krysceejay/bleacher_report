defmodule BleacherReport.Reports do

  alias BleacherReport.Reports.Reaction
  alias BleacherReport.Data

  def main(attrs \\ %{}) do
    [

    ]
  end

  def get_reactions(conn) do
    conn.assign.reaction
  end

  def create_reaction(attrs \\ %{}) do

    get_reactions(conn) ++ attrs
  end

end
