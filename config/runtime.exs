import Config

config :chat_writes,
  bot: [
    bot: ChatWrites,
    user: System.fetch_env!("TWITCH_USER"),
    pass: System.fetch_env!("TWITCH_OAUTH_TOKEN"),
    channels: [System.fetch_env!("TWITCH_USER")]
  ]
