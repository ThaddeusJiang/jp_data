defmodule JpDataWeb.BanksController do
  use JpDataWeb, :controller

  def banks(conn, _) do
    banks = JpData.Banks.list_banks()

    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(200)
    |> json(%{
      items: banks
    })
  end

  def bank(conn, %{"bank_code" => bank_code}) do
    bank = JpData.Banks.get_bank(bank_code)

    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(200)
    |> json(bank)
  end

  def bank_branches(conn, %{"bank_code" => bank_code}) do
    bank_branches = JpData.Banks.list_bank_branches(bank_code)

    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(200)
    |> json(%{
      items: bank_branches
    })
  end
end
