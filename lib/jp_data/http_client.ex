defmodule JpData.HttpClient do
  # The HTTP client for Elixir.
  use HTTPoison.Base

  def process_request_headers(headers) do
    [{"Content-Type", "application/json"} | headers]
  end
end
