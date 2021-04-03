defmodule MembraneTest do
  use ExUnit.Case, async: true
  doctest Membrane

  test "greets the world" do
    assert Membrane.hello() == :world
  end
end
