defmodule JpData.Repo.Migrations.CreateHolidays do
  use Ecto.Migration

  def change do
    create table(:holidays) do
      add :day, :string
      add :name, :string

      timestamps()
    end
  end
end
