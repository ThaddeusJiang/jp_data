defmodule JpData.Repo do
  use Ecto.Repo,
    otp_app: :jp_data,
    adapter: Ecto.Adapters.Postgres
end
