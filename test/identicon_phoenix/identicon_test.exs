defmodule IdenticonTest do
  use ExUnit.Case
  doctest IdenticonPhoenix.Identicon

  alias IdenticonPhoenix.Identicon

  describe "#generate_identicon_binary" do
    test "It should return :ok" do
      check_binary = is_binary Identicon.generate_identicon_binary("test")
      assert check_binary == true
      File.rm("test.png")
    end
  end
end
