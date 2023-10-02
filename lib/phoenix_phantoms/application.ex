defmodule PhoenixPhantoms.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixPhantomsWeb.Telemetry,
      # Start the Ecto repository
      PhoenixPhantoms.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixPhantoms.PubSub},
      # Start Finch
      {Finch, name: PhoenixPhantoms.Finch},
      # Start the Endpoint (http/https)
      PhoenixPhantomsWeb.Endpoint
      # Start a worker by calling: PhoenixPhantoms.Worker.start_link(arg)
      # {PhoenixPhantoms.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixPhantoms.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixPhantomsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
