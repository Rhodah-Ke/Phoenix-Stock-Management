defmodule TradeWeb.ReturnControllerTest do
  use TradeWeb.ConnCase

  import Trade.ReturnsFixtures

  @create_attrs %{quantity: 42, return_date: ~D[2023-07-26], returning_reason: "some returning_reason"}
  @update_attrs %{quantity: 43, return_date: ~D[2023-07-27], returning_reason: "some updated returning_reason"}
  @invalid_attrs %{quantity: nil, return_date: nil, returning_reason: nil}

  describe "index" do
    test "lists all returns", %{conn: conn} do
      conn = get(conn, Routes.return_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Returns"
    end
  end

  describe "new return" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.return_path(conn, :new))
      assert html_response(conn, 200) =~ "New Return"
    end
  end

  describe "create return" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.return_path(conn, :create), return: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.return_path(conn, :show, id)

      conn = get(conn, Routes.return_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Return"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.return_path(conn, :create), return: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Return"
    end
  end

  describe "edit return" do
    setup [:create_return]

    test "renders form for editing chosen return", %{conn: conn, return: return} do
      conn = get(conn, Routes.return_path(conn, :edit, return))
      assert html_response(conn, 200) =~ "Edit Return"
    end
  end

  describe "update return" do
    setup [:create_return]

    test "redirects when data is valid", %{conn: conn, return: return} do
      conn = put(conn, Routes.return_path(conn, :update, return), return: @update_attrs)
      assert redirected_to(conn) == Routes.return_path(conn, :show, return)

      conn = get(conn, Routes.return_path(conn, :show, return))
      assert html_response(conn, 200) =~ "some updated returning_reason"
    end

    test "renders errors when data is invalid", %{conn: conn, return: return} do
      conn = put(conn, Routes.return_path(conn, :update, return), return: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Return"
    end
  end

  describe "delete return" do
    setup [:create_return]

    test "deletes chosen return", %{conn: conn, return: return} do
      conn = delete(conn, Routes.return_path(conn, :delete, return))
      assert redirected_to(conn) == Routes.return_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.return_path(conn, :show, return))
      end
    end
  end

  defp create_return(_) do
    return = return_fixture()
    %{return: return}
  end
end
