#  zipcodes = JpData.Zipcode.read_zipcode_data("2.csv")
zipcodes = JpData.Zipcode.read_zipcode_data()
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
