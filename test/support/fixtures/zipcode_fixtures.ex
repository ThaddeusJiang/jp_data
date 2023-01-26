defmodule JpData.ZipcodeFixtures do
  @doc """
  Generate a zipcode
  """
  def zipcode_fixture do
    %JpData.Address.Zipcode{
      city: "横浜市戸塚区",
      city_kana: "ﾖｺﾊﾏｼﾄﾂｶｸ",
      pref: "神奈川県",
      pref_kana: "ｶﾅｶﾞﾜｹﾝ",
      town: "吉田町",
      town_kana: "ﾖｼﾀﾞﾁｮｳ",
      zipcode: "2440817"
    }
    |> JpData.Repo.insert!()
  end
end
