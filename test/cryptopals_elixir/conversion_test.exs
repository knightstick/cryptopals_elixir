defmodule CryptopalsElixir.ConversionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Conversion

  alias CryptopalsElixir.Conversion

  describe "hex_to_bitstring" do
    def assert_converts_hex_to_bitstring(string, bitstring) do
      assert(Conversion.hex_to_bitstring(string) == bitstring)
    end

    test "0 returns 0" do
      assert_converts_hex_to_bitstring("0", <<0::4>>)
    end

    test "1 returns 1" do
      assert_converts_hex_to_bitstring("1", <<1::4>>)
    end

    test "2 returns 2" do
      assert_converts_hex_to_bitstring("2", <<2::4>>)
    end

    test "non-hex string raises error" do
      assert_raise(ArgumentError, fn ->
        Conversion.hex_to_bitstring("x")
      end)
    end

    test "a returns 10" do
      assert_converts_hex_to_bitstring("a", <<10::4>>)
    end

    test "f returns 15" do
      assert_converts_hex_to_bitstring("f", <<15::4>>)
    end

    test "2 0s returns 0 0" do
      assert_converts_hex_to_bitstring("00", <<0::4, 0::4>>)
    end

    test "a 0 and a 1 returns 0 1" do
      assert_converts_hex_to_bitstring("01", <<0::4, 1::4>>)
    end

    test "1 and 1 returns 1 1" do
      assert_converts_hex_to_bitstring("11", <<1::4, 1::4>>)
    end

    test "2 and b returns 2 11" do
      assert_converts_hex_to_bitstring("2b", <<2::4, 11::4>>)
    end

    test "abc returns 10 11 12" do
      assert_converts_hex_to_bitstring("abc", <<10::4, 11::4, 12::4>>)
    end

    test "a blank string" do
      assert_converts_hex_to_bitstring("", <<>>)
    end
  end

  describe "bitstring_to_base64" do
    test "0" do
      actual = Conversion.bitstring_to_base64(<<0::6>>)
      expected = "A"

      assert(actual == expected)
    end
  end
end
