defmodule JpDataWeb.MojiController do
  use JpDataWeb, :controller

  def moji(conn, %{"q" => ""}) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(400)
    |> json(%{
      status_code: 400,
      status_message: "Bad Request",
      message: "Bad Request"
    })
  end

  def moji(conn, %{"q" => q}) do
    hiragana = JpData.YahooFuriganaV2.furigana(q)
    result = JpData.YahooJlpJimV2.conversion(hiragana)

    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> put_status(200)
    |> json(result)
  end

  def moji(conn, %{}) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(400)
    |> json(%{
      status_code: 400,
      status_message: "Bad Request",
      message: "Bad Request"
    })
  end
end
