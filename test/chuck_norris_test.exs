defmodule ChuckNorrisTest do
  use ExUnit.Case
  doctest ChuckNorris

  test "greets the world" do
    assert ChuckNorris.hello() == :world
  end
end
