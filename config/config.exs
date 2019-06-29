# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :home_api,
  ecto_repos: [HomeApi.Repo]

# Configures the endpoint
config :home_api, HomeApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9SgaL2wGNHZQwLkzrpA/9P4kdFZRrSzJrBVLC4DIjtBD6+BpnkyrCj9rJ9RiL6KV",
  render_errors: [view: HomeApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: HomeApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
