defmodule JpData.Zipcode do
  def search(q) do
    data = read_zipcode_data()
    zipcode = String.replace(q, "-", "")
    Map.get(data, zipcode)
  end

  # read zipcode data from CSV file
  defp read_zipcode_data do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/zipcode.csv"),
      [read_ahead: 100_000],
      1000
    )
    |> CSV.decode()
    |> Enum.map(fn row -> parse_zipcode(row) end)
    |> Enum.reduce(%{}, fn data, acc ->
      Map.put(acc, data.zipcode, data)
    end)
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
