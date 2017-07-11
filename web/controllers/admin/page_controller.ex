defmodule HelloPhoenix.Admin.PageController do
  use HelloPhoenix.Web, :controller

  plug :blah

  def index(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end

  defp blah(conn, _) do
    conn |> put_flash(:info, "Blah!")
  end
end
