# ChatWrites

Do stuff with the most common chat messages.

Right now it just prints to stdout.


## Setup

1. You need the ENV vars found in `config/runtime.exs`
2. Edit `lib/chat_writes/message_collector.ex`'s `handle_most_common/1` function to do whatever.


## Starting

Start the application with `mix`

```
mix run --no-halt
```

Starting with the Elixir interactive shell

```
iex -S mix
```
