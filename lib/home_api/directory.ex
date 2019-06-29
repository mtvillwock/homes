defmodule HomeApi.Directory do
  @moduledoc """
  The Directory context.
  """

  import Ecto.Query, warn: false
  alias HomeApi.Repo

  alias HomeApi.Directory.Home

  @doc """
  Returns the list of homes.

  ## Examples

      iex> list_homes()
      [%Home{}, ...]

  """
  def list_homes do
    Repo.all(Home)
  end

  @doc """
  Gets a single home.

  Raises `Ecto.NoResultsError` if the Home does not exist.

  ## Examples

      iex> get_home!(123)
      %Home{}

      iex> get_home!(456)
      ** (Ecto.NoResultsError)

  """
  def get_home!(id), do: Repo.get!(Home, id)

  @doc """
  Creates a home.

  ## Examples

      iex> create_home(%{field: value})
      {:ok, %Home{}}

      iex> create_home(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_home(attrs \\ %{}) do
    %Home{}
    |> Home.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a home.

  ## Examples

      iex> update_home(home, %{field: new_value})
      {:ok, %Home{}}

      iex> update_home(home, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_home(%Home{} = home, attrs) do
    home
    |> Home.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Home.

  ## Examples

      iex> delete_home(home)
      {:ok, %Home{}}

      iex> delete_home(home)
      {:error, %Ecto.Changeset{}}

  """
  def delete_home(%Home{} = home) do
    Repo.delete(home)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking home changes.

  ## Examples

      iex> change_home(home)
      %Ecto.Changeset{source: %Home{}}

  """
  def change_home(%Home{} = home) do
    Home.changeset(home, %{})
  end
end
