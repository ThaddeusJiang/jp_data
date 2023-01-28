defmodule JpData.Banks.BankBranchFixture do
  @doc """
  Generate a bank branch.
  """
  def bank_branch_fixture do
    %JpData.Banks.BankBranch{
      official_bank_name: "みずほ銀行",
      bank_code: "0001",
      bank_name: "みずほ",
      bank_name_kana: "ﾐｽﾞﾎ",
      branch_code: "001",
      branch_name: "東京営業部",
      branch_name_kana: "ﾄｳｷﾖｳ",
      japanpostbank: "0"
    }
    |> JpData.Repo.insert!()
  end
end
