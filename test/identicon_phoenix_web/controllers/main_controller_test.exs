defmodule IdenticonPhoenixWeb.MainControllerTest do
  use IdenticonPhoenixWeb.ConnCase

  alias IdenticonPhoenix.Accounts

  @create_attrs %{none: "some none"}
  @update_attrs %{none: "some updated none"}
  @invalid_attrs %{none: nil}

  def fixture(:main) do
    {:ok, main} = Accounts.create_main(@create_attrs)
    main
  end

  describe "index" do
    test "lists all mains", %{conn: conn} do
      conn = get conn, main_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Mains"
    end
  end

  describe "new main" do
    test "renders form", %{conn: conn} do
      conn = get conn, main_path(conn, :new)
      assert html_response(conn, 200) =~ "New Main"
    end
  end

  describe "create main" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, main_path(conn, :create), main: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == main_path(conn, :show, id)

      conn = get conn, main_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Main"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, main_path(conn, :create), main: @invalid_attrs
      assert html_response(conn, 200) =~ "New Main"
    end
  end

  describe "edit main" do
    setup [:create_main]

    test "renders form for editing chosen main", %{conn: conn, main: main} do
      conn = get conn, main_path(conn, :edit, main)
      assert html_response(conn, 200) =~ "Edit Main"
    end
  end

  describe "update main" do
    setup [:create_main]

    test "redirects when data is valid", %{conn: conn, main: main} do
      conn = put conn, main_path(conn, :update, main), main: @update_attrs
      assert redirected_to(conn) == main_path(conn, :show, main)

      conn = get conn, main_path(conn, :show, main)
      assert html_response(conn, 200) =~ "some updated none"
    end

    test "renders errors when data is invalid", %{conn: conn, main: main} do
      conn = put conn, main_path(conn, :update, main), main: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Main"
    end
  end

  describe "delete main" do
    setup [:create_main]

    test "deletes chosen main", %{conn: conn, main: main} do
      conn = delete conn, main_path(conn, :delete, main)
      assert redirected_to(conn) == main_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, main_path(conn, :show, main)
      end
    end
  end

  defp create_main(_) do
    main = fixture(:main)
    {:ok, main: main}
  end
end
