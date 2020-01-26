defmodule BleacherReport.Reports do

  alias BleacherReport.Reports.Reaction
  alias BleacherReport.Reports.Content
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

  def get_reaction_by(content_id) do
    case get_content_by(content_id) do
       nil -> nil
        _ -> Enum.filter(get_reactions(), fn %Reaction{content_id: id} -> id == content_id end)
    end
    
  end

  def get_contents do
    Cache.get(:content)
  end

  def get_content_by(content_id) do
    Enum.find(get_contents(), fn %Content{id: id} -> id == content_id end)
  end

  def create_content(attrs \\ %{}) do
    content_struct = Function.get_struct_from_map(attrs, as: %Content{})
    newattrs = get_contents() ++ [content_struct]
    Cache.put(:content, newattrs)

    content_struct
  end


end
