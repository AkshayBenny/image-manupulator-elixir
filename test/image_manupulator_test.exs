defmodule ImageManupulatorTest do
  use ExUnit.Case
  doctest ImageManupulator

  test "greets the world" do
    assert ImageManupulator.hello() == :world
  end
end
