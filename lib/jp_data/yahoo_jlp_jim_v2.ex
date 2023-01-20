defmodule JpData.YahooJlpJimV2 do
  require HTTPoison

  @url "https://jlp.yahooapis.jp/JIMService/V2/conversion"

  def conversion(text) do
    headers = [{"Content-Type", "application/json"}, {"User-Agent", "Yahoo AppID: #{app_id()}"}]

    params = %{
      id: "1",
      jsonrpc: "2.0",
      method: "jlp.jimservice.conversion",
      params: %{
        q: text,
        format: "hiragana",
        mode: "kanakanji",
        option: [
          "hiragana",
          "katakana",
          "alphanumeric",
          "half_katakana",
          "half_alphanumeric"
        ],
        dictionary: ["base", "name", "place", "zip", "symbol"],
        results: 999
      }
    }

    body = Jason.encode!(params)

    case HTTPoison.post(@url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("result")
        |> Map.get("segment")
        |> Enum.reduce(
          %{
            "hiragana" => "",
            "katakana" => "",
            "kanji" => "",
            "half_katakana" => "",
            "half_alphanumeric" => "",
            "alphanumeric" => ""
          },
          fn segment, acc ->
            case segment do
              %{
                "hiragana" => hiragana,
                "katakana" => katakana,
                "candidate" => [head | _],
                "half_katakana" => half_katakana,
                "half_alphanumeric" => half_alphanumeric,
                "alphanumeric" => alphanumeric
              } ->
                acc
                |> Map.put("hiragana", acc["hiragana"] <> hiragana)
                |> Map.put("katakana", acc["katakana"] <> katakana)
                |> Map.put("kanji", acc["kanji"] <> head)
                |> Map.put("half_katakana", acc["half_katakana"] <> half_katakana)
                |> Map.put("half_alphanumeric", acc["half_alphanumeric"] <> half_alphanumeric)
                |> Map.put("alphanumeric", acc["alphanumeric"] <> alphanumeric)

              _ ->
                acc
            end
          end
        )

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        []

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
        []
    end
  end

  defp app_id do
    Application.get_env(:jp_data, :yahoo_app_id)
  end
end
