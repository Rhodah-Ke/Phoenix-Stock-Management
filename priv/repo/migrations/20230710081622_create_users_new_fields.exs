defmodule Trade.Repo.Migrations.NewFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :confirm_password, :string
    end

  end
end
