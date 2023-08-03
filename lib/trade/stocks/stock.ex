defmodule Trade.Stocks.Stock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trade.Receives.Receive


  schema "stocks" do
    field :available_stock, :integer
    field :dispatch_quantity, :integer
    field :receive_quantity, :integer
    field :return_quantity, :integer
    
    belongs_to :receive , Receive


    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:receive_quantity, :dispatch_quantity, :return_quantity, :available_stock, :receive_id])
    |> validate_required([:receive_quantity, :dispatch_quantity, :return_quantity, :available_stock, :receive_id])
  end
end
