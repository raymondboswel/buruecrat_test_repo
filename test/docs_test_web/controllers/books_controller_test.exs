defmodule DocsTestWeb.BooksControllerTest do
  use DocsTestWeb.ConnCase

  alias DocsTest.Library
  alias DocsTest.Library.Books

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:books) do
    {:ok, books} = Library.create_books(@create_attrs)
    books
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get(conn, Routes.books_path(conn, :index)) |> doc
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create books" do
    test "renders books when data is valid", %{conn: conn} do
      conn = post(conn, Routes.books_path(conn, :create), books: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.books_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.books_path(conn, :create), books: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update books" do
    setup [:create_books]

    test "renders books when data is valid", %{conn: conn, books: %Books{id: id} = books} do
      conn = put(conn, Routes.books_path(conn, :update, books), books: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.books_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, books: books} do
      conn = put(conn, Routes.books_path(conn, :update, books), books: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete books" do
    setup [:create_books]

    test "deletes chosen books", %{conn: conn, books: books} do
      conn = delete(conn, Routes.books_path(conn, :delete, books))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.books_path(conn, :show, books))
      end
    end
  end

  defp create_books(_) do
    books = fixture(:books)
    %{books: books}
  end
end
