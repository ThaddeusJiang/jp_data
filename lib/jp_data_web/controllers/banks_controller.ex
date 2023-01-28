defmodule JpDataWeb.BanksController do
  use JpDataWeb, :controller

  def banks(conn, _) do
    banks = JpData.Banks.list()

    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(200)
    |> json(%{
      items: banks
    })
  end
end
