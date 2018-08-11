defmodule IdenticonTest do
  use ExUnit.Case
  doctest IdenticonPhoenix.Identicon

  alias IdenticonPhoenix.Identicon
  alias IdenticonPhoenix.Image

  describe "#generate_identicon_binary" do
    test "It should return :ok" do
      check_binary = is_binary Identicon.generate_identicon_binary("test")
      assert check_binary == true
      File.rm("test.png")
    end
  end

  describe "#hash_input" do
    test "It should generate an %Image struct with the string converted to bin list" do
      test_string = "test"
      assert Identicon.hash_input(test_string) == %Image{hex: :binary.bin_to_list(:crypto.hash(:md5, test_string))}
    end
  end

  describe "#pick_color" do
    test "It should return a new %Image with color attribute" do
      image_struct = %Image{hex: [1,2,3,4,5,6,7,8,9]}
      [r,g,b | _tail] = image_struct.hex
      assert Identicon.pick_color(image_struct) == %Image{image_struct | color: {r,g,b}}
    end
  end

  describe "#build_grid" do
    test "It should return a new %Image with grid attribute" do
      image_struct = %Image{hex: [1,2,3,4,5,6,7,8,9]}
      grid =
        image_struct.hex
        |> Enum.chunk(3)
        |> Enum.map(&Identicon.mirror_row/1) #need to passa a reference of a function in Enum.map
        |> List.flatten
        |> Enum.with_index

      assert Identicon.build_grid(image_struct) == %Image{image_struct | grid: grid}
    end
  end
end
