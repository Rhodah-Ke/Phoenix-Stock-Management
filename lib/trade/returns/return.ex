defmodule Trade.Returns.Return do
  use Ecto.Schema
  alias Trade.Receives.Receive
  import Ecto.Changeset

  schema "returns" do
    field :quantity, :integer
    field :return_date, :date
    field :returning_reason, :string


    belongs_to :receive , Receive

    timestamps()
  end

  @doc false
  def changeset(return, attrs) do
    return
    |> cast(attrs, [ :quantity, :returning_reason, :return_date, :receive_id])
    |> validate_required([ :quantity, :returning_reason, :return_date, :receive_id])
  end
end
