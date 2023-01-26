defmodule JpData.Repo.Migrations.CreateAddressZipcodes do
  use Ecto.Migration

  def change do
    create table(:address_zipcodes) do
      add :zipcode, :string
      add :pref_kana, :string
      add :city_kana, :string
      add :town_kana, :string
      add :pref, :string
      add :city, :string
      add :town, :string

      timestamps()
    end
  end
end
