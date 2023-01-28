defmodule JpData.Banks.BankFixtures do
  @doc """
  Generate a bank
  """
  def bank_fixtures do
    %JpData.Banks.Bank{
      id: "0001",
      code: "0001",
      name: "みずほ銀行",
      name_kana: "ミズホギンコウ"
    }
    |> JpData.Repo.insert!()
  end
end
