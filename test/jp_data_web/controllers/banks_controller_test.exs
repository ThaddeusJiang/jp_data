defmodule JpDataWeb.BanksControllerText do
  use JpDataWeb.ConnCase

  test "GET /banks", %{conn: conn} do
    JpData.Banks.BankFixtures.bank_fixture()

    conn = get(conn, ~p"/api/v1/banks")

    assert json_response(conn, 200) == %{
             "items" => [
               %{
                 "code" => "0001",
                 "name" => "みずほ銀行",
                 "name_kana" => "ミズホギンコウ"
               }
             ]
           }
  end
end
