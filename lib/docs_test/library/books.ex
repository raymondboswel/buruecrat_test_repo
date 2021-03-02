defmodule DocsTest.Library.Books do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(books, attrs) do
    books
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
