defmodule BleacherReport.Data do
  alias BleacherReport.Accounts.User
  alias BleacherReport.Reports.Content
  alias BleacherReport.Reports.Reaction

  def users do
    [
      %User{
        id: "nnbbnnhgghjkjkkkjh",
        name: "Chris"
      },
      %User{
        id: "mmnnbvccxzasdfg",
        name: "Fred"
      },
      %User{
        id: "mmmkjhhfdfghjjgfdsfg",
        name: "Hope"
      }
    ]
  end

  def contents do
    [
      %Content{
        id: 1,
        user_id: 1,
        title: "First post"
      },
      %Content{
        id: 2,
        user_id: 1,
        title: "Second post"
      },
      %Content{
        id: 3,
        user_id: 2,
        title: "Third post"
      }
    ]
  end

  def reactions do
    []
  end

end
