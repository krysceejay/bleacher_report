defmodule BleacherReport.Reports do

  alias BleacherReport.Reports.Reaction
  alias BleacherReport.{Cache, Function}

  def create_reaction(attrs \\ %{}) do
    reaction_struct = Function.get_struct_from_map(attrs, as: %Reaction{})
    newattrs = get_reactions() ++ [reaction_struct]
    Cache.put(:reaction, newattrs)

    reaction_struct
  end

  def get_reactions do
    Cache.get(:reaction)
  end


end
