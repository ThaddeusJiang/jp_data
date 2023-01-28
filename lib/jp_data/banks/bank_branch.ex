defmodule JpData.Banks.BankBranch do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [
             :official_bank_name,
             :bank_code,
             :bank_name,
             :bank_name_kana,
             :branch_code,
             :branch_name,
             :branch_name_kana,
             :japanpostbank
           ]}
  schema "bank_branches" do
    # 銀行コード
    field(:bank_code, :string)
    # 銀行名
    field(:bank_name, :string)
    # 銀行名カナ
    field(:bank_name_kana, :string)
    # 支店コード
    field(:branch_code, :string)
    # 支店名
    field(:branch_name, :string)
    # 支店名カナ
    field(:branch_name_kana, :string)
    # ゆうちょ記号
    field(:japanpostbank, :string)
    # 正式銀行名
    field(:official_bank_name, :string)

    timestamps()
  end

  @doc false
  def changeset(bank_branch, attrs) do
    bank_branch
    |> cast(attrs, [
      :official_bank_name,
      :bank_name,
      :bank_name_kana,
      :branch_name,
      :branch_name_kana,
      :bank_code,
      :branch_code,
      :japanpostbank
    ])
    |> validate_required([
      :official_bank_name,
      :bank_name,
      :bank_name_kana,
      :branch_name,
      :branch_name_kana,
      :bank_code,
      :branch_code,
      :japanpostbank
    ])
  end
end
