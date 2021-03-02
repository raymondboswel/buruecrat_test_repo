defmodule DocsTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DocsTest.Repo,
      # Start the Telemetry supervisor
      DocsTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DocsTest.PubSub},
      # Start the Endpoint (http/https)
      DocsTestWeb.Endpoint
      # Start a worker by calling: DocsTest.Worker.start_link(arg)
      # {DocsTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DocsTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DocsTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
