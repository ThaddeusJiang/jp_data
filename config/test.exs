import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :jp_data, JpData.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "jp_data_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jp_data, JpDataWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "inUvoewbBDwP9cgIYYVK4uunr6EuVv6enrpDyINWrutvpW0AgZ1k/05hyQg+rqVT",
  server: false

# In test we don't send emails.
config :jp_data, JpData.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
config :jp_data, :yahoo_app_id, "dj00aiZpPURoT3lxUnVUV0R6UyZzPWNvbnN1bWVyc2VjcmV0Jng9ZTA-"
config :jp_data, :rate_limit, 100
