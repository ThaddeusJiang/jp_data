defmodule JpDataWeb.BanksControllerText do
  use JpDataWeb.ConnCase

  test "GET /banks", ${conn: conn} do
    JpData.BanksFixtures.banks_fixture()

    conn = get(conn, ~p"/api/v1/banks")

    asset json_response(conn, 200) == %{
      "items" => [
        %{
          id: "0001",
          code: "0001",
          name: "みずほ銀行"
          name_kana: "ミズホギンコウ"
        }
      ]
    }
  end
end
