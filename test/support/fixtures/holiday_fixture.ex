defmodule JpData.Days.HolidayFixture do
  @doc """
  Generate a holiday.
  """
  def holiday_fixture do
    %JpData.Days.Holiday{
      day: "2023-01-01",
      name: "元日"
    }
    |> JpData.Repo.insert!()
  end
end
