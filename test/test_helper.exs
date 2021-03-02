ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(DocsTest.Repo, :manual)

Bureaucrat.start(
  writer: Bureaucrat.ApiBlueprintWriter,
  default_path: "docs/API.apib",
  paths: [],
  titles: [{DocsTestWeb.BooksController, "Books API"}],
  env_var: "DOC",
  json_library: Poison
)

ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])
