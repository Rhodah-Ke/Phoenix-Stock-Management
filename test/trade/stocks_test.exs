defmodule Trade.StocksTest do
  use Trade.DataCase

  alias Trade.Stocks

  describe "stocks" do
    alias Trade.Stocks.Stock

    import Trade.StocksFixtures

    @invalid_attrs %{available_stock: nil, dispatch_quantity: nil, receive_quantity: nil, return_quantity: nil}

    test "list_stocks/0 returns all stocks" do
      stock = stock_fixture()
      assert Stocks.list_stocks() == [stock]
    end

    test "get_stock!/1 returns the stock with given id" do
      stock = stock_fixture()
      assert Stocks.get_stock!(stock.id) == stock
    end

    test "create_stock/1 with valid data creates a stock" do
      valid_attrs = %{available_stock: 42, dispatch_quantity: 42, receive_quantity: 42, return_quantity: 42}

      assert {:ok, %Stock{} = stock} = Stocks.create_stock(valid_attrs)
      assert stock.available_stock == 42
      assert stock.dispatch_quantity == 42
      assert stock.receive_quantity == 42
      assert stock.return_quantity == 42
    end

    test "create_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stocks.create_stock(@invalid_attrs)
    end

    test "update_stock/2 with valid data updates the stock" do
      stock = stock_fixture()
      update_attrs = %{available_stock: 43, dispatch_quantity: 43, receive_quantity: 43, return_quantity: 43}

      assert {:ok, %Stock{} = stock} = Stocks.update_stock(stock, update_attrs)
      assert stock.available_stock == 43
      assert stock.dispatch_quantity == 43
      assert stock.receive_quantity == 43
      assert stock.return_quantity == 43
    end

    test "update_stock/2 with invalid data returns error changeset" do
      stock = stock_fixture()
      assert {:error, %Ecto.Changeset{}} = Stocks.update_stock(stock, @invalid_attrs)
      assert stock == Stocks.get_stock!(stock.id)
    end

    test "delete_stock/1 deletes the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{}} = Stocks.delete_stock(stock)
      assert_raise Ecto.NoResultsError, fn -> Stocks.get_stock!(stock.id) end
    end

    test "change_stock/1 returns a stock changeset" do
      stock = stock_fixture()
      assert %Ecto.Changeset{} = Stocks.change_stock(stock)
    end
  end
end
