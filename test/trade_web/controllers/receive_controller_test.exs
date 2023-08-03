defmodule TradeWeb.ReceiveControllerTest do
  use TradeWeb.ConnCase

  import Trade.ReceivesFixtures

  @create_attrs %{brand_name: "some brand_name", global_product_code: "some global_product_code", gtin: "some gtin", net_weight: "some net_weight", price_per_item: "120.5", product_description: "some product_description", receiving_date: ~D[2023-07-12], unit_of_measure: "some unit_of_measure"}
  @update_attrs %{brand_name: "some updated brand_name", global_product_code: "some updated global_product_code", gtin: "some updated gtin", net_weight: "some updated net_weight", price_per_item: "456.7", product_description: "some updated product_description", receiving_date: ~D[2023-07-13], unit_of_measure: "some updated unit_of_measure"}
  @invalid_attrs %{brand_name: nil, global_product_code: nil, gtin: nil, net_weight: nil, price_per_item: nil, product_description: nil, receiving_date: nil, unit_of_measure: nil}

  describe "index" do
    test "lists all receives", %{conn: conn} do
      conn = get(conn, Routes.receive_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Receives"
    end
  end

  describe "new receive" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.receive_path(conn, :new))
      assert html_response(conn, 200) =~ "New Receive"
    end
  end

  describe "create receive" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.receive_path(conn, :create), receive: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.receive_path(conn, :show, id)

      conn = get(conn, Routes.receive_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Receive"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.receive_path(conn, :create), receive: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Receive"
    end
  end

  describe "edit receive" do
    setup [:create_receive]

    test "renders form for editing chosen receive", %{conn: conn, receive: receive} do
      conn = get(conn, Routes.receive_path(conn, :edit, receive))
      assert html_response(conn, 200) =~ "Edit Receive"
    end
  end

  describe "update receive" do
    setup [:create_receive]

    test "redirects when data is valid", %{conn: conn, receive: receive} do
      conn = put(conn, Routes.receive_path(conn, :update, receive), receive: @update_attrs)
      assert redirected_to(conn) == Routes.receive_path(conn, :show, receive)

      conn = get(conn, Routes.receive_path(conn, :show, receive))
      assert html_response(conn, 200) =~ "some updated brand_name"
    end

    test "renders errors when data is invalid", %{conn: conn, receive: receive} do
      conn = put(conn, Routes.receive_path(conn, :update, receive), receive: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Receive"
    end
  end

  describe "delete receive" do
    setup [:create_receive]

    test "deletes chosen receive", %{conn: conn, receive: receive} do
      conn = delete(conn, Routes.receive_path(conn, :delete, receive))
      assert redirected_to(conn) == Routes.receive_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.receive_path(conn, :show, receive))
      end
    end
  end

  defp create_receive(_) do
    receive = receive_fixture()
    %{receive: receive}
  end
end
