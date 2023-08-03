defmodule Trade.Receives.Receive do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trade.Dispatches.Dispatch
  alias Trade.Returns.Return
  alias Trade.Stocks.Stock


  schema "receives" do
    field :brand_name, :string
    field :global_product_code, :string
    field :gtin, :string
    field :net_weight, :string
    field :price_per_item, :decimal
    field :quantity, :integer
    field :product_description, :string
    field :receiving_date, :date
    field :unit_of_measure, :string

    #relationships
    has_many :dispatches , Dispatch
    has_many :returns , Return
    has_many :stocks , Stock



    timestamps()
  end

  @doc false
  def changeset(receive, attrs) do
    receive
    |> cast(attrs, [:gtin, :brand_name, :product_description, :net_weight, :unit_of_measure, :global_product_code, :price_per_item, :quantity, :receiving_date])
    |> validate_required([:gtin, :brand_name, :product_description, :net_weight, :unit_of_measure, :global_product_code, :price_per_item, :quantity, :receiving_date])
    |> validate_format(:gtin, ~r/^\d{13}$/, message: "GTIN must be numerical and have exactly 13 characters")
    |> validate_format(:global_product_code, ~r/^\d+$/, message: "Global product code must consist of numerals")
  end

end
