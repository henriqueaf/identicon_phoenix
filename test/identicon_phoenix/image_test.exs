defmodule ImageTest do
  use ExUnit.Case
  doctest IdenticonPhoenix.Image

  test "Assert Image struct attributes" do
    assert %IdenticonPhoenix.Image{} == %IdenticonPhoenix.Image{color: nil, grid: nil, hex: nil, pixel_map: nil}
  end
end
