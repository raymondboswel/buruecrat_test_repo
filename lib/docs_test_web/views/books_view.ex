defmodule DocsTestWeb.BooksView do
  use DocsTestWeb, :view
  alias DocsTestWeb.BooksView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BooksView, "books.json")}
  end

  def render("show.json", %{books: books}) do
    %{data: render_one(books, BooksView, "books.json")}
  end

  def render("books.json", %{books: books}) do
    %{id: books.id,
      name: books.name}
  end
end
