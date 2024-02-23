defmodule ChatWrites do
  use TwitchChat.Bot

  alias ChatWrites.MessageCollector
  alias TwitchChat.Events.Message

  @impl TwitchChat.Bot
  def handle_event(%Message{message: message} = _event) do
    MessageCollector.add(message)
  end
end
