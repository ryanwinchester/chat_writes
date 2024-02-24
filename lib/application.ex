defmodule ChatWrites.Application do
  @moduledoc """
  Start the application and supervision tree.
  """
  use Application

  @impl true
  def start(_type, _args) do
    server_opts = Application.fetch_env!(:chat_writes, ChatWrites.TCPAcceptor)
    message_collector_opts = Application.fetch_env!(:chat_writes, ChatWrites.MessageCollector)
    twitch_bot_opts = Application.fetch_env!(:chat_writes, :bot)

    children = [
      {Task.Supervisor, name: ChatWrites.TaskSupervisor},
      Supervisor.child_spec({Task, fn -> ChatWrites.TCPAcceptor.accept(server_opts) end},
        restart: :permanent
      ),
      {ChatWrites.MessageCollector, message_collector_opts},
      {TwitchChat.Supervisor, twitch_bot_opts}
    ]

    opts = [strategy: :one_for_one, name: ChatWrites.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
