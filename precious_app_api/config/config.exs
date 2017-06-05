# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :precious_app_api,
  ecto_repos: [PreciousAppApi.Repo]

# Configures the endpoint
config :precious_app_api, PreciousAppApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8A/1Amwx+AvQgoldneAmIbrAwZzVt5eitSRAYrL11ydm+MZwscYmUsHLD1jcyy0q",
  render_errors: [view: PreciousAppApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PreciousAppApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
