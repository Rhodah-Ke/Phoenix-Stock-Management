defmodule Trade.Repo.Migrations.CreateReceives do
  use Ecto.Migration

  def change do
    create table(:receives) do
      add :gtin, :string
      add :brand_name, :string
      add :product_description, :string
      add :net_weight, :string
      add :unit_of_measure, :string
      add :global_product_code, :string
      add :price_per_item, :decimal
      add :receiving_date, :date

      timestamps()
    end
  end
end
