defmodule JpData.Repo.Migrations.CreateBankBranches do
  use Ecto.Migration

  def change do
    create table(:bank_branches) do
      add :official_bank_name, :string
      add :bank_name, :string
      add :bank_name_kana, :string
      add :branch_name, :string
      add :branch_name_kana, :string
      add :bank_code, :string
      add :branch_code, :string
      add :japanpostbank, :string

      timestamps()
    end
  end
end
