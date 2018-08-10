defmodule IdenticonPhoenixWeb.MainControllerTest do
  use IdenticonPhoenixWeb.ConnCase

  # alias IdenticonPhoenix.Accounts

  # @create_attrs %{none: "some none"}
  # @update_attrs %{none: "some updated none"}
  # @invalid_attrs %{none: nil}

  # def fixture(:main) do
  #   {:ok, main} = Accounts.create_main(@create_attrs)
  #   main
  # end

  describe "index" do
    test "lists all mains", %{conn: conn} do
      conn = get conn, main_path(conn, :index)
      assert html_response(conn, 200) =~ "Generate Identicon"
    end
  end

  describe "identicon" do
    # setup [:create_main]
    test "render identicon binary image", %{conn: conn} do
      string = "identicon test"
      conn = get conn, main_path(conn, :identicon, string)
      image = IdenticonPhoenix.Identicon.generate_identicon_binary(string)

      assert response_content_type(conn, :jpeg) =~ "charset=utf-8"
      assert response(conn, 200) =~ image
    end
  end

  # defp create_main(_) do
  #   main = fixture(:main)
  #   {:ok, main: main}
  # end
end
