defmodule Trade.Repo.Migrations.CreateReturns do
  use Ecto.Migration

  def change do
    create table(:returns) do
      add :quantity, :integer
      add :returning_reason, :string
      add :return_date, :date
      add :receive_id, references(:receives, on_delete: :nothing)

      timestamps()
    end

    create index(:returns, [:receive_id])
  end
end
