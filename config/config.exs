# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :docs_test,
  ecto_repos: [DocsTest.Repo]

# Configures the endpoint
config :docs_test, DocsTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pIVm6HuhJissF3BT9/z0tgqDwS0FN7ZbVLYZ9X4u/vNn41JSmDuonwhbJ0IOrnmD",
  render_errors: [view: DocsTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DocsTest.PubSub,
  live_view: [signing_salt: "3B/IbKKt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
