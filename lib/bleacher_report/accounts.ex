defmodule BleacherReport.Accounts do
  alias BleacherReport.Accounts.User
  alias BleacherReport.Data
  alias BleacherReport.{Cache, Function}

  def list_users do
    Cache.get(:users)
  end

  def get_user_by(userid) do
    Enum.find(list_users, fn %User{id: id} -> id == userid end)
  end

  def create_user(attrs \\ %{}) do
    user_struct = Function.get_struct_from_map(attrs, as: %User{})
    newattrs = list_users ++ [user_struct]
    Cache.put(:users, newattrs)

    user_struct
  end

  
end
