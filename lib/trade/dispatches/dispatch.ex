defmodule Trade.Dispatches.Dispatch do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trade.Receives.Receive
 

  schema "dispatches" do
    field :consumer_location, :string
    field :consumer_name, :string
    field :consumer_phone, :string
    field :dispatch_date, :date
    field :quantity, :integer

    belongs_to :receive , Receive



    timestamps()
  end

  @doc false
  def changeset(dispatch, attrs) do
    dispatch
    |> cast(attrs, [:quantity,  :consumer_name, :consumer_phone, :consumer_location, :dispatch_date, :receive_id])
    |> validate_required([ :quantity,   :consumer_name, :consumer_phone, :consumer_location, :dispatch_date, :receive_id])
  end
end
