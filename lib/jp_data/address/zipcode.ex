defmodule JpData.Address.Zipcode do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [:city, :city_kana, :pref, :pref_kana, :town, :town_kana, :zipcode]}
  schema "address_zipcodes" do
    field(:city, :string)
    field(:city_kana, :string)
    field(:pref, :string)
    field(:pref_kana, :string)
    field(:town, :string)
    field(:town_kana, :string)
    field(:zipcode, :string)

    timestamps()
  end

  @doc false
  def changeset(zipcode, attrs) do
    zipcode
    |> cast(attrs, [:zipcode, :pref_kana, :city_kana, :town_kana, :pref, :city, :town])
    |> validate_required([:zipcode, :pref_kana, :city_kana, :town_kana, :pref, :city, :town])
  end
end
