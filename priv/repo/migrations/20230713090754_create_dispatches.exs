defmodule Trade.Repo.Migrations.CreateDispatches do
  use Ecto.Migration

  def change do
    create table(:dispatches) do
      add :product_description, :string
      add :quantity, :integer
      add :price_per_item, :decimal
      add :total_price, :decimal
      add :consumer_name, :string
      add :consumer_phone, :string
      add :consumer_location, :string
      add :dispatch_date, :date
      add :receive_id, references(:receives, on_delete: :nothing)

      timestamps()
    end

    create index(:dispatches, [:receive_id])
  end
end
