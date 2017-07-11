defmodule HelloPhoenix.HealthCheckController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end
end
