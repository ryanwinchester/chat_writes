defmodule ChatWrites.TCPServerTest do
  use ExUnit.Case

  alias ChatWrites.TCPServer
  alias ChatWrites.TestTCPClient

  test "accepts connections and sends messages" do
    assert {:ok, pid} = TestTCPClient.start()
    :erlang.trace(pid, true, [:receive])
    :ok = TCPServer.send("foo")
    assert_receive {:trace, ^pid, :receive, {:tcp, _port, "foo"}}
  end
end
