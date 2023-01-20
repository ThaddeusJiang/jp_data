defmodule JpData.YahooFuriganaV2 do
  require HTTPoison

  @url "https://jlp.yahooapis.jp/FuriganaService/V2/furigana"

  def furigana(text) do
    headers = [{"Content-Type", "application/json"}, {"User-Agent", "Yahoo AppID: #{app_id()}"}]

    params = %{
      id: DateTime.utc_now() |> DateTime.to_string(),
      jsonrpc: "2.0",
      method: "jlp.furiganaservice.furigana",
      params: %{
        q: text,
        grade: 1
      }
    }

    body = Jason.encode!(params)

    case HTTPoison.post(@url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("result")
        |> Map.get("word")
        |> Enum.map(fn word -> get_furigana(word) end)
        |> Enum.join("")

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        []

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
        []
    end
  end

  defp get_furigana(%{"furigana" => value, "surface" => _}) do
    value
  end

  defp get_furigana(%{"surface" => value}) do
    value
  end

  defp app_id do
    Application.get_env(:jp_data, :yahoo_app_id)
  end
end
