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

zipcodes = read_zipcode_data()
alias JpData.Repo

Enum.each(zipcodes, fn data ->
  Repo.insert!(%JpData.Address.Zipcode{
    city: data.city,
    city_kana: data.city_kana,
    pref: data.pref,
    pref_kana: data.pref_kana,
    town: data.town,
    town_kana: data.town_kana,
    zipcode: data.zipcode
  })
end)
