defmodule JpData.Zipcode do
  alias JpData.Repo
  alias JpData.Address.Zipcode

  import Ecto.Query

  def search(q) do
    zipcode = String.replace(q, "-", "")

    Repo.all(
      from(z in Zipcode,
        where: z.zipcode == ^zipcode
      )
    )
  end

  # read zipcode data from CSV file
  def read_zipcode_data do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/zipcode/all.csv"),
      [read_ahead: 124_429],
      124_429
    )
    |> CSV.decode()
    |> Enum.map(fn row -> parse_zipcode(row) end)
  end

  def read_zipcode_data(file_name) do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/zipcode/#{file_name}"),
      [read_ahead: 10000],
      10000
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
