defmodule ChatWrites.Application do
  @moduledoc """
  Start the application and supervision tree.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {ChatWrites.MessageCollector,
       Application.fetch_env!(:chat_writes, ChatWrites.MessageCollector)},
      {TwitchChat.Supervisor, Application.fetch_env!(:chat_writes, :bot)}
    ]

    opts = [strategy: :one_for_one, name: ChatWrites.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
