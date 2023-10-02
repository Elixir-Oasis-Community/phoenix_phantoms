defmodule PhoenixPhantoms.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_phantoms,
    adapter: Ecto.Adapters.Postgres
end
