defmodule JpData.Zipcode do
  def search(q) do
    zipcode = String.replace(q, "-", "")
    #  Repo.one by zipcode
    JpData.Address.Zipcode
    |> JpData.Repo.get_by(zipcode: zipcode)
  end

  # read zipcode data from CSV file
  def read_zipcode_data do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "repo/zipcode.csv"),
      [read_ahead: 124_429],
      124_429
    )
    |> CSV.decode()
    |> Enum.map(fn row -> parse_zipcode(row) end)
  end

  defp parse_zipcode({:ok, row}) do
    # [_, _, zipcode, pref_kana, city_kana, town_kana, pref, city, town, _, _, _, _, _, _, _] = row
    [
      _,
      _,
      zipcode,
      pref_kana,
      city_kana,
      town_kana,
      pref,
      city,
      town,
      _,
      _,
      _,
      _,
      _,
      _
    ] = row

    %{
      zipcode: zipcode,
      pref_kana: pref_kana,
      city_kana: city_kana,
      town_kana: town_kana,
      pref: pref,
      city: city,
      town: town
    }
  end
end
