defmodule HomeApi.Directory.Home do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homes" do
    field :description, :string
    field :name, :string
    field :price, :integer
    field :tag, :string

    timestamps()
  end

  @doc false
  def changeset(home, attrs) do
    home
    |> cast(attrs, [:name, :description, :tag, :price])
    |> validate_required([:name, :description, :tag, :price])
  end
end
