defmodule JpData.Days do
  alias JpData.Repo
  alias JpData.Days.Holiday

  import Ecto.Query

  def list_holidays do
    Repo.all(
      from(h in Holiday,
        order_by: [asc: h.id]
      )
    )
  end

  # read days data from CSV file
  @spec read_days_data :: list
  def read_days_data do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/holidays/syukujitsu.csv"),
      [read_ahead: 124_429],
      124_429
    )
    |> CSV.decode()
    |> Enum.drop(1)
    |> Enum.map(fn row -> parse_day(row) end)
  end

  defp parse_day({:ok, row}) do
    [day, name] = row

    %{
      day: day,
      name: name
    }
  end
end
