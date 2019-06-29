defmodule HomeApi.Repo.Migrations.CreateHomes do
  use Ecto.Migration

  def change do
    create table(:homes) do
      add :name, :string
      add :description, :text
      add :tag, :string
      add :price, :integer

      timestamps()
    end

  end
end
