defmodule JpDataWeb.PageController do
  use JpDataWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def moji(conn, %{"q" => ""}) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(400)
    |> json(%{
      statusCode: 400,
      statusMessage: "Bad Request",
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
      statusCode: 400,
      statusMessage: "Bad Request",
      message: "Bad Request"
    })
  end
end
