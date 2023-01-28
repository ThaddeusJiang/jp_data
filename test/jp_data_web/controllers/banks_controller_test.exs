defmodule JpDataWeb.BanksControllerText do
  use JpDataWeb.ConnCase

  test "GET /banks", %{conn: conn} do
    JpData.Banks.BankBranchFixture.bank_branch_fixture()

    conn = get(conn, ~p"/api/v1/banks")

    assert json_response(conn, 200) == %{
             "items" => [
               %{
                 "official_bank_name" => "みずほ銀行",
                 "bank_code" => "0001",
                 "bank_name" => "みずほ",
                 "bank_name_kana" => "ﾐｽﾞﾎ"
               }
             ]
           }
  end

  test "GET /banks/0001", %{conn: conn} do
    JpData.Banks.BankBranchFixture.bank_branch_fixture()

    conn = get(conn, ~p"/api/v1/banks/0001")

    assert json_response(conn, 200) == %{
             "official_bank_name" => "みずほ銀行",
             "bank_code" => "0001",
             "bank_name" => "みずほ",
             "bank_name_kana" => "ﾐｽﾞﾎ"
           }
  end

  test "GET /banks/0001/branches", %{conn: conn} do
    JpData.Banks.BankBranchFixture.bank_branch_fixture()

    conn = get(conn, ~p"/api/v1/banks/0001/branches")

    assert json_response(conn, 200) == %{
             "items" => [
               %{
                 "official_bank_name" => "みずほ銀行",
                 "bank_code" => "0001",
                 "bank_name" => "みずほ",
                 "bank_name_kana" => "ﾐｽﾞﾎ",
                 "branch_code" => "001",
                 "branch_name" => "東京営業部",
                 "branch_name_kana" => "ﾄｳｷﾖｳ",
                 "japanpostbank" => "0"
               }
             ]
           }
  end
end
