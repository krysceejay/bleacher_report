defmodule BleacherReport.Reports do

  import Plug.Conn
  alias BleacherReport.Reports.Reaction
  alias BleacherReport.Data
  alias BleacherReport.Cache

  def create_reaction(attrs \\ %{}) do
    newattrs = get_reactions() ++ [attrs]
    Cache.put(:reaction, newattrs)
  end

  def get_reactions do
    Cache.get(:reaction)
  end

end
