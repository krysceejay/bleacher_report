defmodule BleacherReport.Function do
  
  def get_struct_from_map(map, as: a_struct) do
    # Find the keys within the map
    keys = Map.keys(a_struct) 
             |> Enum.filter(fn x -> x != :__struct__ end)
    # Process map, checking for both string / atom keys
    processed_map =
     for key <- keys, into: %{} do
         value = Map.get(map, key) || Map.get(map, to_string(key))
         {key, value}
       end
    a_struct = Map.merge(a_struct, processed_map)
    a_struct
  end

  def rand_string(length) do
    length
    |> :crypto.strong_rand_bytes
    |> Base.encode64
    |> String.downcase
  end
  
end