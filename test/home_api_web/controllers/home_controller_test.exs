defmodule HomeApiWeb.HomeControllerTest do
  use HomeApiWeb.ConnCase

  alias HomeApi.Directory
  alias HomeApi.Directory.Home

  @create_attrs %{
    description: "some description",
    name: "some name",
    price: 42,
    tag: "some tag"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    price: 43,
    tag: "some updated tag"
  }
  @invalid_attrs %{description: nil, name: nil, price: nil, tag: nil}

  def fixture(:home) do
    {:ok, home} = Directory.create_home(@create_attrs)
    home
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all homes", %{conn: conn} do
      conn = get(conn, Routes.home_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create home" do
    test "renders home when data is valid", %{conn: conn} do
      conn = post(conn, Routes.home_path(conn, :create), home: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.home_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "price" => 42,
               "tag" => "some tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.home_path(conn, :create), home: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update home" do
    setup [:create_home]

    test "renders home when data is valid", %{conn: conn, home: %Home{id: id} = home} do
      conn = put(conn, Routes.home_path(conn, :update, home), home: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.home_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "price" => 43,
               "tag" => "some updated tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, home: home} do
      conn = put(conn, Routes.home_path(conn, :update, home), home: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete home" do
    setup [:create_home]

    test "deletes chosen home", %{conn: conn, home: home} do
      conn = delete(conn, Routes.home_path(conn, :delete, home))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.home_path(conn, :show, home))
      end
    end
  end

  defp create_home(_) do
    home = fixture(:home)
    {:ok, home: home}
  end
end
