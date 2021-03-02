defmodule DocsTest.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias DocsTest.Repo

  alias DocsTest.Library.Books

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Books{}, ...]

  """
  def list_books do
    Repo.all(Books)
  end

  @doc """
  Gets a single books.

  Raises `Ecto.NoResultsError` if the Books does not exist.

  ## Examples

      iex> get_books!(123)
      %Books{}

      iex> get_books!(456)
      ** (Ecto.NoResultsError)

  """
  def get_books!(id), do: Repo.get!(Books, id)

  @doc """
  Creates a books.

  ## Examples

      iex> create_books(%{field: value})
      {:ok, %Books{}}

      iex> create_books(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_books(attrs \\ %{}) do
    %Books{}
    |> Books.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a books.

  ## Examples

      iex> update_books(books, %{field: new_value})
      {:ok, %Books{}}

      iex> update_books(books, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_books(%Books{} = books, attrs) do
    books
    |> Books.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a books.

  ## Examples

      iex> delete_books(books)
      {:ok, %Books{}}

      iex> delete_books(books)
      {:error, %Ecto.Changeset{}}

  """
  def delete_books(%Books{} = books) do
    Repo.delete(books)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking books changes.

  ## Examples

      iex> change_books(books)
      %Ecto.Changeset{data: %Books{}}

  """
  def change_books(%Books{} = books, attrs \\ %{}) do
    Books.changeset(books, attrs)
  end
end
