defmodule HomeApiWeb.HomeController do
  use HomeApiWeb, :controller

  alias HomeApi.Directory
  alias HomeApi.Directory.Home

  action_fallback HomeApiWeb.FallbackController

  def index(conn, _params) do
    homes = Directory.list_homes()
    render(conn, "index.json", homes: homes)
  end

  def create(conn, %{"home" => home_params}) do
    with {:ok, %Home{} = home} <- Directory.create_home(home_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.home_path(conn, :show, home))
      |> render("show.json", home: home)
    end
  end

  def show(conn, %{"id" => id}) do
    home = Directory.get_home!(id)
    render(conn, "show.json", home: home)
  end

  def update(conn, %{"id" => id, "home" => home_params}) do
    home = Directory.get_home!(id)

    with {:ok, %Home{} = home} <- Directory.update_home(home, home_params) do
      render(conn, "show.json", home: home)
    end
  end

  def delete(conn, %{"id" => id}) do
    home = Directory.get_home!(id)

    with {:ok, %Home{}} <- Directory.delete_home(home) do
      send_resp(conn, :no_content, "")
    end
  end
end
