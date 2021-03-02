defmodule DocsTest.LibraryTest do
  use DocsTest.DataCase

  alias DocsTest.Library

  describe "books" do
    alias DocsTest.Library.Books

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def books_fixture(attrs \\ %{}) do
      {:ok, books} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Library.create_books()

      books
    end

    test "list_books/0 returns all books" do
      books = books_fixture()
      assert Library.list_books() == [books]
    end

    test "get_books!/1 returns the books with given id" do
      books = books_fixture()
      assert Library.get_books!(books.id) == books
    end

    test "create_books/1 with valid data creates a books" do
      assert {:ok, %Books{} = books} = Library.create_books(@valid_attrs)
      assert books.name == "some name"
    end

    test "create_books/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_books(@invalid_attrs)
    end

    test "update_books/2 with valid data updates the books" do
      books = books_fixture()
      assert {:ok, %Books{} = books} = Library.update_books(books, @update_attrs)
      assert books.name == "some updated name"
    end

    test "update_books/2 with invalid data returns error changeset" do
      books = books_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_books(books, @invalid_attrs)
      assert books == Library.get_books!(books.id)
    end

    test "delete_books/1 deletes the books" do
      books = books_fixture()
      assert {:ok, %Books{}} = Library.delete_books(books)
      assert_raise Ecto.NoResultsError, fn -> Library.get_books!(books.id) end
    end

    test "change_books/1 returns a books changeset" do
      books = books_fixture()
      assert %Ecto.Changeset{} = Library.change_books(books)
    end
  end
end
