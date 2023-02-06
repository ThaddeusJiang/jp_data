defmodule JpData.Days.Holidays do
  use Ecto.Schema
  import Ecto.Changeset

  schema "holidays" do
    field :day, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(holidays, attrs) do
    holidays
    |> cast(attrs, [:day, :name])
    |> validate_required([:day, :name])
  end
end
