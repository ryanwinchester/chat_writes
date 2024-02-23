import Config

config :chat_writes,
  bot: [
    bot: ChatWrites,
    user: System.fetch_env!("TWITCH_USER"),
    pass: System.fetch_env!("TWITCH_OAUTH_TOKEN"),
    channels: [System.fetch_env!("TWITCH_USER")]
  ]

config :chat_writes, ChatWrites.MessageCollector,
  interval_ms: System.get_env("CHAT_INTERVAL", "5000") |> String.to_integer()
