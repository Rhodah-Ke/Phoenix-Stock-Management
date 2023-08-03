defmodule TradeWeb.DispatchControllerTest do
  use TradeWeb.ConnCase

  import Trade.DispatchesFixtures

  @create_attrs %{consumer_location: "some consumer_location", consumer_name: "some consumer_name", consumer_phone: "some consumer_phone", dispatch_date: ~N[2023-07-12 09:07:00], price_per_item: "120.5", product_description: "some product_description", quantity: 42, total_price: "120.5"}
  @update_attrs %{consumer_location: "some updated consumer_location", consumer_name: "some updated consumer_name", consumer_phone: "some updated consumer_phone", dispatch_date: ~N[2023-07-13 09:07:00], price_per_item: "456.7", product_description: "some updated product_description", quantity: 43, total_price: "456.7"}
  @invalid_attrs %{consumer_location: nil, consumer_name: nil, consumer_phone: nil, dispatch_date: nil, price_per_item: nil, product_description: nil, quantity: nil, total_price: nil}

  describe "index" do
    test "lists all dispatches", %{conn: conn} do
      conn = get(conn, Routes.dispatch_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dispatches"
    end
  end

  describe "new dispatch" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dispatch_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dispatch"
    end
  end

  describe "create dispatch" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dispatch_path(conn, :create), dispatch: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dispatch_path(conn, :show, id)

      conn = get(conn, Routes.dispatch_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dispatch"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dispatch_path(conn, :create), dispatch: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dispatch"
    end
  end

  describe "edit dispatch" do
    setup [:create_dispatch]

    test "renders form for editing chosen dispatch", %{conn: conn, dispatch: dispatch} do
      conn = get(conn, Routes.dispatch_path(conn, :edit, dispatch))
      assert html_response(conn, 200) =~ "Edit Dispatch"
    end
  end

  describe "update dispatch" do
    setup [:create_dispatch]

    test "redirects when data is valid", %{conn: conn, dispatch: dispatch} do
      conn = put(conn, Routes.dispatch_path(conn, :update, dispatch), dispatch: @update_attrs)
      assert redirected_to(conn) == Routes.dispatch_path(conn, :show, dispatch)

      conn = get(conn, Routes.dispatch_path(conn, :show, dispatch))
      assert html_response(conn, 200) =~ "some updated consumer_location"
    end

    test "renders errors when data is invalid", %{conn: conn, dispatch: dispatch} do
      conn = put(conn, Routes.dispatch_path(conn, :update, dispatch), dispatch: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dispatch"
    end
  end

  describe "delete dispatch" do
    setup [:create_dispatch]

    test "deletes chosen dispatch", %{conn: conn, dispatch: dispatch} do
      conn = delete(conn, Routes.dispatch_path(conn, :delete, dispatch))
      assert redirected_to(conn) == Routes.dispatch_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.dispatch_path(conn, :show, dispatch))
      end
    end
  end

  defp create_dispatch(_) do
    dispatch = dispatch_fixture()
    %{dispatch: dispatch}
  end
end
