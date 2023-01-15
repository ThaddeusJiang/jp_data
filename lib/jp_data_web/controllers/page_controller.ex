defmodule JpDataWeb.PageController do
  use JpDataWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def furigana(conn, %{"q" => ""}) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(400)
    |> json(%{
      statusCode: 400,
      statusMessage: "Bad Request",
      message: "Bad Request"
    })
  end

  def furigana(conn, %{"q" => q}) do
    result = JpData.Furigana.get_furigana(q)

    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(200)
    |> json(%{
      furigana: result
    })
  end

  def furigana(conn, %{}) do
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
