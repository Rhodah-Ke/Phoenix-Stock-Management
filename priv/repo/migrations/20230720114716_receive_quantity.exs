defmodule Trade.Repo.Migrations.ReceiveQuantity do
  use Ecto.Migration

  def change do
    alter table(:receives) do
      add :quantity, :integer
    end

  end
end
