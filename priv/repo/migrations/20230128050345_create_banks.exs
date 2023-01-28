defmodule JpData.Repo.Migrations.CreateBanks do
  use Ecto.Migration

  def change do
    create table(:banks, primary_key: false) do
      add :id, :string, primary_key: true
      add :code, :string
      add :name, :string
      add :name_kana, :string

      timestamps()
    end
  end
end
