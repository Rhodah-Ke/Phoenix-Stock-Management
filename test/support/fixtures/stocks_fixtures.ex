defmodule Trade.StocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trade.Stocks` context.
  """

  @doc """
  Generate a stock.
  """
  def stock_fixture(attrs \\ %{}) do
    {:ok, stock} =
      attrs
      |> Enum.into(%{
        available_stock: 42,
        dispatched_quantity: 42,
        received_quantity: 42,
        returns_quantity: 42
      })
      |> Trade.Stocks.create_stock()

    stock
  end

  @doc """
  Generate a stock.
  """
  def stock_fixture(attrs \\ %{}) do
    {:ok, stock} =
      attrs
      |> Enum.into(%{
        available_quantity: 42,
        dispatch_quantity: 42,
        quantity: 42,
        return_quantity: 42
      })
      |> Trade.Stocks.create_stock()

    stock
  end

  @doc """
  Generate a stock.
  """
  def stock_fixture(attrs \\ %{}) do
    {:ok, stock} =
      attrs
      |> Enum.into(%{
        available_quantity: 42,
        dispatch_quantity: 42,
        receive_quantity: 42,
        return_quantity: 42
      })
      |> Trade.Stocks.create_stock()

    stock
  end

  @doc """
  Generate a stock.
  """
  def stock_fixture(attrs \\ %{}) do
    {:ok, stock} =
      attrs
      |> Enum.into(%{
        available_stock: 42,
        dispatch_quantity: 42,
        receive_quantity: 42,
        return_quantity: 42
      })
      |> Trade.Stocks.create_stock()

    stock
  end
end
