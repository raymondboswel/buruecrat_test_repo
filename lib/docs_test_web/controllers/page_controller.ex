defmodule DocsTestWeb.PageController do
  use DocsTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
