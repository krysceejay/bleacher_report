defmodule BleacherReport.Cache do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{}, name: BleacherCache)
  end

  def init(state) do
    :ets.new(:app_cache, [:set, :public, :named_table])
    {:ok, state}
  end

  def delete(key) do
    GenServer.cast(BleacherCache, {:delete, key})
  end

  def get(key) do
    GenServer.call(BleacherCache, {:get, key})
  end

  def put(key, data) do
    GenServer.cast(BleacherCache, {:put, key, data})
  end

  def handle_cast({:delete, key}, state) do
    :ets.delete(:app_cache, key)
    {:noreply, state}
  end

  def handle_call({:get, key}, _from, state) do
    data = 
      case :ets.lookup(:app_cache, key) do
        [] -> []
        [{_key, data}] -> data
      end
    {:reply, data, state}
  end

  def handle_cast({:put, key, data}, state) do
    :ets.insert(:app_cache, {key, data})
    {:noreply, state}
  end

  
end