# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view,
  ecto_repos: [LiveView.Repo]

# Configures the endpoint
config :live_view, LiveViewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NHJgkGFKhLcfE/Wg0+/P1FyuZO6wdcqRaFGPtexNO5pz1nxEB3T28QRUXsT/IjJI",
  render_errors: [view: LiveViewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveView.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "yWrTw1SMvl4++Z2vD/3aQi2Kta1awq6j"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
