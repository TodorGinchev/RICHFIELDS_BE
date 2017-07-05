# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :authentication_api,
  ecto_repos: [AuthenticationApi.Repo]

# Configures the endpoint
config :authentication_api, AuthenticationApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UKzidocUOTiqIV8U7QX61pKENLZ+kmr7qdVTFm1NAKcHTJ3q09E/SIv3Is6VAs8V",
  render_errors: [view: AuthenticationApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthenticationApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
