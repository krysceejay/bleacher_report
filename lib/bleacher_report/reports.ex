defmodule BleacherReport.Reports do

  alias BleacherReport.Reports.Reaction
  alias BleacherReport.Data

  def create_reaction(attrs \\ %{}) do
    
    Data.reactions() ++ attrs
  end

end
