defmodule HomeApiWeb.HomeView do
  use HomeApiWeb, :view
  alias HomeApiWeb.HomeView

  def render("index.json", %{homes: homes}) do
    %{data: render_many(homes, HomeView, "home.json")}
  end

  def render("show.json", %{home: home}) do
    %{data: render_one(home, HomeView, "home.json")}
  end

  def render("home.json", %{home: home}) do
    %{id: home.id,
      name: home.name,
      description: home.description,
      tag: home.tag,
      price: home.price}
  end
end
