defmodule JpDataWeb.ZipcodeController do
  use JpDataWeb, :controller

  def zipcode(conn, %{"q" => ""}) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(400)
    |> json(%{
      status_code: 400,
      status_message: "Bad Request",
      message: "Bad Request"
    })
  end

  def zipcode(conn, %{"q" => q}) do
    result = JpData.Zipcode.search(q)

    case result do
      nil ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> put_status(404)
        |> json(%{
          status_code: 404,
          status_message: "Not Found",
          message: "Not Found"
        })

      _ ->
        conn
        |> put_resp_header("content-type", "application/json;charset=utf-8")
        |> put_status(200)
        |> json(result)
    end
  end

  def zipcode(conn, %{}) do
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
