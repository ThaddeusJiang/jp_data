holidays = JpData.Days.read_days_data()

alias JpData.Repo

Enum.each(holidays, fn data ->
  Repo.insert!(%JpData.Days.Holiday{
    day: data.day,
    name: data.name
  })
end)
