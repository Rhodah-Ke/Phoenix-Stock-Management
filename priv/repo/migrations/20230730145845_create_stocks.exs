defmodule Trade.Repo.Migrations.CreateStocks do
  use Ecto.Migration

  def change do
    create table(:stocks) do
      add :receive_quantity, :integer
      add :dispatch_quantity, :integer
      add :return_quantity, :integer
      add :available_stock, :integer
      add :receive_id, references(:receives, on_delete: :nothing)

      timestamps()
    end

    create index(:stocks, [:receive_id])
  end
end
