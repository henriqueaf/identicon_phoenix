defmodule IdenticonPhoenixWeb.MainController do
  use IdenticonPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def identicon(conn, %{"name_string" => name_string}) do
    image = IdenticonPhoenix.Identicon.generate_identicon_binary(name_string)

    conn
    |> put_resp_content_type("image/jpeg", "utf-8")
    |> send_resp(200, image)
  end
end
