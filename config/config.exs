# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sapphire,
  ecto_repos: [Sapphire.Repo]

# Configures the endpoint
config :sapphire, SapphireWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0c7Skf+jwwIn+FW5WBQbpMcxKGid25b5s6DMpP/J4vEq1IJx2NUlkBwIAtD1pVsx",
  render_errors: [view: SapphireWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sapphire.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
