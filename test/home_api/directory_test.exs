defmodule HomeApi.DirectoryTest do
  use HomeApi.DataCase

  alias HomeApi.Directory

  describe "homes" do
    alias HomeApi.Directory.Home

    @valid_attrs %{description: "some description", name: "some name", price: 42, tag: "some tag"}
    @update_attrs %{description: "some updated description", name: "some updated name", price: 43, tag: "some updated tag"}
    @invalid_attrs %{description: nil, name: nil, price: nil, tag: nil}

    def home_fixture(attrs \\ %{}) do
      {:ok, home} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_home()

      home
    end

    test "list_homes/0 returns all homes" do
      home = home_fixture()
      assert Directory.list_homes() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Directory.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      assert {:ok, %Home{} = home} = Directory.create_home(@valid_attrs)
      assert home.description == "some description"
      assert home.name == "some name"
      assert home.price == 42
      assert home.tag == "some tag"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      assert {:ok, %Home{} = home} = Directory.update_home(home, @update_attrs)
      assert home.description == "some updated description"
      assert home.name == "some updated name"
      assert home.price == 43
      assert home.tag == "some updated tag"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_home(home, @invalid_attrs)
      assert home == Directory.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Directory.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Directory.change_home(home)
    end
  end
end
