defmodule JpData.Banks.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}
  @derive {Jason.Encoder, only: [:code, :name, :name_kana]}
  schema "banks" do
    field :code, :string
    field :name_kana, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(bank, attrs) do
    bank
    |> cast(attrs, [:id, :code, :name, :name_kana])
    |> validate_required([:id, :code, :name])
  end
end
