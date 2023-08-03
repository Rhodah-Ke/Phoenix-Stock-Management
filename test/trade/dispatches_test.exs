defmodule Trade.DispatchesTest do
  use Trade.DataCase

  alias Trade.Dispatches

  describe "dispatches" do
    alias Trade.Dispatches.Dispatch

    import Trade.DispatchesFixtures

    @invalid_attrs %{consumer_location: nil, consumer_name: nil, consumer_phone: nil, dispatch_date: nil, price_per_item: nil, product_description: nil, quantity: nil, total_price: nil}

    test "list_dispatches/0 returns all dispatches" do
      dispatch = dispatch_fixture()
      assert Dispatches.list_dispatches() == [dispatch]
    end

    test "get_dispatch!/1 returns the dispatch with given id" do
      dispatch = dispatch_fixture()
      assert Dispatches.get_dispatch!(dispatch.id) == dispatch
    end

    test "create_dispatch/1 with valid data creates a dispatch" do
      valid_attrs = %{consumer_location: "some consumer_location", consumer_name: "some consumer_name", consumer_phone: "some consumer_phone", dispatch_date: ~N[2023-07-12 09:07:00], price_per_item: "120.5", product_description: "some product_description", quantity: 42, total_price: "120.5"}

      assert {:ok, %Dispatch{} = dispatch} = Dispatches.create_dispatch(valid_attrs)
      assert dispatch.consumer_location == "some consumer_location"
      assert dispatch.consumer_name == "some consumer_name"
      assert dispatch.consumer_phone == "some consumer_phone"
      assert dispatch.dispatch_date == ~N[2023-07-12 09:07:00]
      assert dispatch.price_per_item == Decimal.new("120.5")
      assert dispatch.product_description == "some product_description"
      assert dispatch.quantity == 42
      assert dispatch.total_price == Decimal.new("120.5")
    end

    test "create_dispatch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dispatches.create_dispatch(@invalid_attrs)
    end

    test "update_dispatch/2 with valid data updates the dispatch" do
      dispatch = dispatch_fixture()
      update_attrs = %{consumer_location: "some updated consumer_location", consumer_name: "some updated consumer_name", consumer_phone: "some updated consumer_phone", dispatch_date: ~N[2023-07-13 09:07:00], price_per_item: "456.7", product_description: "some updated product_description", quantity: 43, total_price: "456.7"}

      assert {:ok, %Dispatch{} = dispatch} = Dispatches.update_dispatch(dispatch, update_attrs)
      assert dispatch.consumer_location == "some updated consumer_location"
      assert dispatch.consumer_name == "some updated consumer_name"
      assert dispatch.consumer_phone == "some updated consumer_phone"
      assert dispatch.dispatch_date == ~N[2023-07-13 09:07:00]
      assert dispatch.price_per_item == Decimal.new("456.7")
      assert dispatch.product_description == "some updated product_description"
      assert dispatch.quantity == 43
      assert dispatch.total_price == Decimal.new("456.7")
    end

    test "update_dispatch/2 with invalid data returns error changeset" do
      dispatch = dispatch_fixture()
      assert {:error, %Ecto.Changeset{}} = Dispatches.update_dispatch(dispatch, @invalid_attrs)
      assert dispatch == Dispatches.get_dispatch!(dispatch.id)
    end

    test "delete_dispatch/1 deletes the dispatch" do
      dispatch = dispatch_fixture()
      assert {:ok, %Dispatch{}} = Dispatches.delete_dispatch(dispatch)
      assert_raise Ecto.NoResultsError, fn -> Dispatches.get_dispatch!(dispatch.id) end
    end

    test "change_dispatch/1 returns a dispatch changeset" do
      dispatch = dispatch_fixture()
      assert %Ecto.Changeset{} = Dispatches.change_dispatch(dispatch)
    end
  end
end
