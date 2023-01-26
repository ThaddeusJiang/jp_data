defmodule JpDataWeb.ZipcodeController do
  use JpDataWeb, :controller

  def zipcode(conn, %{"q" => ""}) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(400)
    |> json(%{
      statusCode: 400,
      statusMessage: "Bad Request",
      message: "Bad Request"
    })
  end

  def zipcode(conn, %{"q" => q}) do
    result = JpData.Zipcode.search(q)

    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> put_status(200)
    |> json(result)
  end

  def zipcode(conn, %{}) do
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
