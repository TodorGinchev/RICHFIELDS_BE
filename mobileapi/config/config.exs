# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mobileapi,
  ecto_repos: [Mobileapi.Repo]

# Configures the endpoint
config :mobileapi, Mobileapi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tOU3b+eoTq6gK1WFiCy9Gsaun/FSnAoS02hjrA3Dk+evZn+D1hrCe9pEy3WRZLbi",
  render_errors: [view: Mobileapi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mobileapi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
