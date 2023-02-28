defmodule JpData.Days.Holiday do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:day, :name]}
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
