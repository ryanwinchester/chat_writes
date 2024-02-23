defmodule ChatWritesTest do
  use ExUnit.Case
  doctest ChatWrites

  test "greets the world" do
    assert ChatWrites.hello() == :world
  end
end
