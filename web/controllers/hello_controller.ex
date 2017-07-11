defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome")
    |> put_flash(:error, "Grrrr")
    |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger, "format" => "text"}) do
    conn |> text("Hello #{messenger}")
  end

  def show(conn, %{"messenger" => messenger, "format" => "json"}) do
    conn |> json(%{message: messenger})
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, :show, messenger: messenger
  end
end
