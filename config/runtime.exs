import Config

# Twitch chat bot config.
config :chat_writes,
  bot: [
    bot: ChatWrites,
    user: System.fetch_env!("TWITCH_USER"),
    pass: System.fetch_env!("TWITCH_OAUTH_TOKEN"),
    channels: [System.fetch_env!("TWITCH_USER")]
  ]

# Chat message collector interval in milliseconds.
config :chat_writes, ChatWrites.MessageCollector,
  interval_ms: System.get_env("CHAT_INTERVAL", "5000") |> String.to_integer()

# Logger config. Valid values are: `debug, info, warning, error`.
config :logger, :console, level: System.get_env("LOG_LEVEL", "info") |> String.to_existing_atom()
