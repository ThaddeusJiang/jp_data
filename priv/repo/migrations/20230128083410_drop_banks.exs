defmodule JpData.Repo.Migrations.DropBanks do
  use Ecto.Migration

  def change do
    drop(table("banks"))
  end
end
