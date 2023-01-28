defmodule JpData.Banks do
  alias JpData.Repo
  alias JpData.Banks.BankBranch

  import Ecto.Query

  def list_banks do
    BankBranch
    |> group_by([b], b.bank_code)
    |> select([b], %{
      bank_code: b.bank_code,
      bank_name: min(b.bank_name),
      bank_name_kana: min(b.bank_name_kana),
      official_bank_name: min(b.official_bank_name)
    })
    |> Repo.all()
  end

  def get_bank(bank_code) do
    BankBranch
    |> where([b], b.bank_code == ^bank_code)
    |> select([b], %{
      bank_code: min(b.bank_code),
      bank_name: min(b.bank_name),
      bank_name_kana: min(b.bank_name_kana),
      official_bank_name: min(b.official_bank_name)
    })
    |> Repo.one()
  end

  def list_bank_branches(bank_code) do
    BankBranch
    |> where([b], b.bank_code == ^bank_code)
    |> Repo.all()
  end

  def init_all_bank_branches do
    bank_branches = read_bank_branches_csv()
    # TODO: 我应该学习一下 insert_all 的用法
    # Repo.insert_all(BankBranch, bank_branches)
    Enum.each(bank_branches, fn bank_branch ->
      Repo.insert!(%BankBranch{
        official_bank_name: bank_branch.official_bank_name,
        bank_name: bank_branch.bank_name,
        bank_name_kana: bank_branch.bank_name_kana,
        branch_name: bank_branch.branch_name,
        branch_name_kana: bank_branch.branch_name_kana,
        bank_code: bank_branch.bank_code,
        branch_code: bank_branch.branch_code,
        japanpostbank: bank_branch.japanpostbank
      })
    end)
  end

  def read_bank_branches_csv(file_name) do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/banks/#{file_name}.csv"),
      [read_ahead: 30000],
      30000
    )
    |> CSV.decode()
    |> Enum.map(fn row -> parse_bank_branch(row) end)
  end

  defp read_bank_branches_csv do
    File.stream!(
      Path.join(:code.priv_dir(:jp_data), "data/banks/bank_branches.csv"),
      [read_ahead: 30000],
      30000
    )
    |> CSV.decode()
    |> Enum.drop(1)
    |> Enum.map(fn row -> parse_bank_branch(row) end)
  end

  defp parse_bank_branch({:ok, row}) do
    [
      official_bank_name,
      bank_name,
      bank_name_kana,
      branch_name,
      branch_name_kana,
      bank_code,
      branch_code,
      japanpostbank
    ] = row

    %{
      official_bank_name: official_bank_name,
      bank_name: bank_name,
      bank_name_kana: bank_name_kana,
      branch_name: branch_name,
      branch_name_kana: branch_name_kana,
      bank_code: bank_code,
      branch_code: branch_code,
      japanpostbank: japanpostbank
    }
  end
end
