defmodule Trade.ReceivesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trade.Receives` context.
  """

  @doc """
  Generate a receive.
  """
  def receive_fixture(attrs \\ %{}) do
    {:ok, receive} =
      attrs
      |> Enum.into(%{
        brand_name: "some brand_name",
        country_of_sale: "some country_of_sale",
        global_product_code: "some global_product_code",
        gtin: "some gtin",
        net_weight: 120.5,
        product_description: "some product_description",
        unit_of_measure: "some unit_of_measure"
      })
      |> Trade.Receives.create_receive()

    receive
  end

  @doc """
  Generate a receive.
  """
  def receive_fixture(attrs \\ %{}) do
    {:ok, receive} =
      attrs
      |> Enum.into(%{
        brand_name: "some brand_name",
        global_product_code: "some global_product_code",
        gtin: "some gtin",
        net_weight: "some net_weight",
        price_per_item: "120.5",
        product_description: "some product_description",
        receiving_date: ~D[2023-07-12],
        unit_of_measure: "some unit_of_measure"
      })
      |> Trade.Receives.create_receive()

    receive
  end
end
