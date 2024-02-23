defmodule ChatWrites.MixProject do
  use Mix.Project

  def project do
    [
      app: :chat_writes,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ChatWrites.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:twitch_chat, github: "hellostream/twitch_chat", branch: "main"}
    ]
  end
end
