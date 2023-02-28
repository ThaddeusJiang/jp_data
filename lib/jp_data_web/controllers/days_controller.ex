defmodule JpDataWeb.DaysController do
  use JpDataWeb, :controller

  def holidays(conn, _params) do
    holidays = JpData.Days.list_holidays()

    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(200)
    |> json(%{
      items: holidays
    })
  end
end
