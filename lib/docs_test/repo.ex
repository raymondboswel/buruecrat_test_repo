defmodule DocsTest.Repo do
  use Ecto.Repo,
    otp_app: :docs_test,
    adapter: Ecto.Adapters.Postgres
end
