defmodule Trade.ReturnsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trade.Returns` context.
  """

  @doc """
  Generate a return.
  """
  def return_fixture(attrs \\ %{}) do
    {:ok, return} =
      attrs
      |> Enum.into(%{
        consumer_phone: "some consumer_phone",
        quantity: 42,
        reason_for_return: "some reason_for_return",
        return_date: ~D[2023-07-13]
      })
      |> Trade.Returns.create_return()

    return
  end

  @doc """
  Generate a return.
  """
  def return_fixture(attrs \\ %{}) do
    {:ok, return} =
      attrs
      |> Enum.into(%{
        quantity: 42,
        return_date: ~D[2023-07-13],
        returning_reason: "some returning_reason"
      })
      |> Trade.Returns.create_return()

    return
  end

  @doc """
  Generate a return.
  """
  def return_fixture(attrs \\ %{}) do
    {:ok, return} =
      attrs
      |> Enum.into(%{
        quantity: 42,
        return_date: ~D[2023-07-26],
        returning_reason: "some returning_reason"
      })
      |> Trade.Returns.create_return()

    return
  end
end
