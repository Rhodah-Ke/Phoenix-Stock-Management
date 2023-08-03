defmodule Trade.ReceivesTest do
  use Trade.DataCase

  alias Trade.Receives

  describe "receives" do
    alias Trade.Receives.Receive

    import Trade.ReceivesFixtures

    @invalid_attrs %{brand_name: nil, global_product_code: nil, gtin: nil, net_weight: nil, price_per_item: nil, product_description: nil, receiving_date: nil, unit_of_measure: nil}

    test "list_receives/0 returns all receives" do
      receive = receive_fixture()
      assert Receives.list_receives() == [receive]
    end

    test "get_receive!/1 returns the receive with given id" do
      receive = receive_fixture()
      assert Receives.get_receive!(receive.id) == receive
    end

    test "create_receive/1 with valid data creates a receive" do
      valid_attrs = %{brand_name: "some brand_name", global_product_code: "some global_product_code", gtin: "some gtin", net_weight: "some net_weight", price_per_item: "120.5", product_description: "some product_description", receiving_date: ~D[2023-07-12], unit_of_measure: "some unit_of_measure"}

      assert {:ok, %Receive{} = receive} = Receives.create_receive(valid_attrs)
      assert receive.brand_name == "some brand_name"
      assert receive.global_product_code == "some global_product_code"
      assert receive.gtin == "some gtin"
      assert receive.net_weight == "some net_weight"
      assert receive.price_per_item == Decimal.new("120.5")
      assert receive.product_description == "some product_description"
      assert receive.receiving_date == ~D[2023-07-12]
      assert receive.unit_of_measure == "some unit_of_measure"
    end

    test "create_receive/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receives.create_receive(@invalid_attrs)
    end

    test "update_receive/2 with valid data updates the receive" do
      receive = receive_fixture()
      update_attrs = %{brand_name: "some updated brand_name", global_product_code: "some updated global_product_code", gtin: "some updated gtin", net_weight: "some updated net_weight", price_per_item: "456.7", product_description: "some updated product_description", receiving_date: ~D[2023-07-13], unit_of_measure: "some updated unit_of_measure"}

      assert {:ok, %Receive{} = receive} = Receives.update_receive(receive, update_attrs)
      assert receive.brand_name == "some updated brand_name"
      assert receive.global_product_code == "some updated global_product_code"
      assert receive.gtin == "some updated gtin"
      assert receive.net_weight == "some updated net_weight"
      assert receive.price_per_item == Decimal.new("456.7")
      assert receive.product_description == "some updated product_description"
      assert receive.receiving_date == ~D[2023-07-13]
      assert receive.unit_of_measure == "some updated unit_of_measure"
    end

    test "update_receive/2 with invalid data returns error changeset" do
      receive = receive_fixture()
      assert {:error, %Ecto.Changeset{}} = Receives.update_receive(receive, @invalid_attrs)
      assert receive == Receives.get_receive!(receive.id)
    end

    test "delete_receive/1 deletes the receive" do
      receive = receive_fixture()
      assert {:ok, %Receive{}} = Receives.delete_receive(receive)
      assert_raise Ecto.NoResultsError, fn -> Receives.get_receive!(receive.id) end
    end

    test "change_receive/1 returns a receive changeset" do
      receive = receive_fixture()
      assert %Ecto.Changeset{} = Receives.change_receive(receive)
    end
  end
end
