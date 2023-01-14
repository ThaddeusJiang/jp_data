defmodule JpData.Utils.RateLimit do
  import Plug.Conn
  use JpDataWeb, :controller

  alias JpData.Utils.GetIp
  require Logger

  @limit 2

  def init(opts), do: opts

  def call(conn, _opts) do
    ip = GetIp.get_ip()

    case Hammer.check_rate(ip, 60_000, @limit) do
      {:allow, count} ->
        assign(conn, :requests_count, count)

      {:deny, _limit} ->
        Logger.info("Rate limit exceeded for #{inspect(ip)}")
        error_response(conn)
    end
  end

  defp error_response(conn) do
    conn
    |> put_status(429)
    |> json(%{
      statusCode: 429,
      statusMessage: "Too Many Requests",
      message: "Too Many Requests"
    })
    |> halt()
  end
end
