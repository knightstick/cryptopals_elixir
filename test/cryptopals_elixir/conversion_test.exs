defmodule CryptopalsElixir.ConversionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Conversion

  alias CryptopalsElixir.Conversion

  describe "hex_to_bitstring" do
    def assert_converts_hex_to_bitstring(string, bitstring) do
      assert(Conversion.hex_to_bitstring(string) == bitstring)
    end

    test "converting a single char to bitstring" do
      assert_converts_hex_to_bitstring("0", <<0::4>>)
    end

    test "converting a 1 to bitstring" do
      assert_converts_hex_to_bitstring("1", <<1::4>>)
    end

    test "converting a 2 to bitstring" do
      assert_converts_hex_to_bitstring("2", <<2::4>>)
    end

    test "raises an error if the string is not hex" do
      assert_raise(ArgumentError, fn ->
        Conversion.hex_to_bitstring("x")
      end)
    end

    test "converting an a to a bitstring" do
      assert_converts_hex_to_bitstring("a", <<10::4>>)
    end

    test "converting an f to a bitstring" do
      assert_converts_hex_to_bitstring("f", <<15::4>>)
    end

    test "2 0s" do
      assert_converts_hex_to_bitstring("00", <<0::4, 0::4>>)
    end

    test "a 0 and a 1" do
      assert_converts_hex_to_bitstring("01", <<0::4, 1::4>>)
    end

    test "converting a 1 and a 1" do
      assert_converts_hex_to_bitstring("11", <<1::4, 1::4>>)
    end

    test "converting a 2 and a b" do
      assert_converts_hex_to_bitstring("2b", <<2::4, 11::4>>)
    end

    test "converting 3 char string" do
      assert_converts_hex_to_bitstring("abc", <<10::4, 11::4, 12::4>>)
    end

    test "a blank string" do
      assert_converts_hex_to_bitstring("", <<>>)
    end
  end
end
