defmodule JpData.Days do
  # read days data from CSV file
  def read_days_data do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/holidays/syukujitsu.csv"),
      [read_ahead: 124_429],
      124_429
    )
    |> CSV.decode()
    |> Enum.drop(1)
  end
end
