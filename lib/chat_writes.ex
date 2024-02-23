defmodule ChatWrites do
  @moduledoc """
  The twitch chat bot event handler.
  We handle the message event here and add the message text to the message collector.
  """
  use TwitchChat.Bot

  alias ChatWrites.MessageCollector
  alias TwitchChat.Events.Message

  @impl TwitchChat.Bot
  def handle_event(%Message{message: message} = _event) do
    MessageCollector.add(message)
  end
end
