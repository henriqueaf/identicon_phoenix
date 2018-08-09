# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :identicon_phoenix,
  ecto_repos: [IdenticonPhoenix.Repo]

# Configures the endpoint
config :identicon_phoenix, IdenticonPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mwxvu8Htz9KZOOacYvLETMwWYlT8M3Iu0u6ZtCzVbLWYVz4dFJ2rWYDA/dkcNsUf",
  render_errors: [view: IdenticonPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IdenticonPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
