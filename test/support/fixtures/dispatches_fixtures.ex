defmodule Trade.DispatchesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trade.Dispatches` context.
  """

  @doc """
  Generate a dispatch.
  """
  def dispatch_fixture(attrs \\ %{}) do
    {:ok, dispatch} =
      attrs
      |> Enum.into(%{
        consumer_location: "some consumer_location",
        consumer_name: "some consumer_name",
        consumer_phone: "some consumer_phone",
        dispatch_date: ~N[2023-07-11 06:06:00],
        price_per_item: "120.5",
        product_description: "some product_description",
        quantity: 42,
        total_price: "120.5"
      })
      |> Trade.Dispatches.create_dispatch()

    dispatch
  end

  @doc """
  Generate a dispatch.
  """
  def dispatch_fixture(attrs \\ %{}) do
    {:ok, dispatch} =
      attrs
      |> Enum.into(%{
        consumer_location: "some consumer_location",
        consumer_name: "some consumer_name",
        consumer_phone: "some consumer_phone",
        dispatch_date: ~N[2023-07-11 08:13:00],
        price_per_item: "120.5",
        product_description: "some product_description",
        quantity: 42,
        total_price: "120.5"
      })
      |> Trade.Dispatches.create_dispatch()

    dispatch
  end

  @doc """
  Generate a dispatch.
  """
  def dispatch_fixture(attrs \\ %{}) do
    {:ok, dispatch} =
      attrs
      |> Enum.into(%{
        consumer_location: "some consumer_location",
        consumer_name: "some consumer_name",
        consumer_phone_number: "some consumer_phone_number",
        dispatch_date: ~D[2023-07-12],
        price_per_item: "120.5",
        product_description: "some product_description",
        quantity: 42
      })
      |> Trade.Dispatches.create_dispatch()

    dispatch
  end

  @doc """
  Generate a dispatch.
  """
  def dispatch_fixture(attrs \\ %{}) do
    {:ok, dispatch} =
      attrs
      |> Enum.into(%{
        consumer_location: "some consumer_location",
        consumer_name: "some consumer_name",
        consumer_phone_number: "some consumer_phone_number",
        dispatch_date: ~D[2023-07-12],
        price_per_item: "120.5",
        product_description: "some product_description",
        quantity: 42,
        receive_id: "some receive_id"
      })
      |> Trade.Dispatches.create_dispatch()

    dispatch
  end

  @doc """
  Generate a dispatch.
  """
  def dispatch_fixture(attrs \\ %{}) do
    {:ok, dispatch} =
      attrs
      |> Enum.into(%{
        consumer_location: "some consumer_location",
        consumer_name: "some consumer_name",
        consumer_phone: "some consumer_phone",
        dispatch_date: ~N[2023-07-12 09:07:00],
        price_per_item: "120.5",
        product_description: "some product_description",
        quantity: 42,
        total_price: "120.5"
      })
      |> Trade.Dispatches.create_dispatch()

    dispatch
  end
end
