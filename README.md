# ChatWrites

Do stuff with the most common chat messages.

Right now it just prints to the standard output.


## Setup

1. You need the ENV vars found in `config/runtime.exs`

2. Edit `lib/message_collector.ex` module's `handle_most_common/1` function to do whatever.


## Starting

Start the application with `mix`

```
mix run --no-halt
```

Starting with Docker

```
docker composer up
```

Starting with the Elixir interactive shell

```
iex -S mix
```

Start `neovim` with

```
nvim . --listen /tmp/nvim-server
```

See:
- https://neovim.io/doc/user/remote.html#--remote-send
- https://neovim.io/doc/user/starting.html#--listen
(Thanks @dmmulroy)
