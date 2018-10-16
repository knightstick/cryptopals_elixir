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
    def assert_converts_bitstring_to_base64string(bitstring, base64string) do
      assert(Conversion.bitstring_to_base64(bitstring) == base64string)
    end

    test "0" do
      assert_converts_bitstring_to_base64string(<<0::6>>, "A")
    end

    test "1" do
      assert_converts_bitstring_to_base64string(<<1::6>>, "B")
    end

    test "25" do
      assert_converts_bitstring_to_base64string(<<25::6>>, "Z")
    end

    test "26" do
      assert_converts_bitstring_to_base64string(<<26::6>>, "a")
    end

    test "51" do
      assert_converts_bitstring_to_base64string(<<51::6>>, "z")
    end

    test "52" do
      assert_converts_bitstring_to_base64string(<<52::6>>, "0")
    end

    test "61" do
      assert_converts_bitstring_to_base64string(<<61::6>>, "9")
    end

    test "62" do
      assert_converts_bitstring_to_base64string(<<62::6>>, "+")
    end

    test "63" do
      assert_converts_bitstring_to_base64string(<<0b111111::6>>, "/")
    end

    test "0, 0" do
      assert_converts_bitstring_to_base64string(<<0::6, 0::6>>, "AA")
    end

    test "0, 2" do
      assert_converts_bitstring_to_base64string(<<0::6, 2::6>>, "AC")
    end

    test "30, 30" do
      assert_converts_bitstring_to_base64string(<<30::6, 30::6>>, "ee")
    end

    test "5, 35" do
      assert_converts_bitstring_to_base64string(<<5::6, 35::6>>, "Fj")
    end

    test "7, 34, 62" do
      assert_converts_bitstring_to_base64string(<<7::6, 34::6, 62::6>>, "Hi+")
    end
  end

  describe "hex_to_base64" do
    test "three 0s" do
      actual = Conversion.hex_to_base64("000")
      expected = "AA"

      assert(actual == expected)
    end

    test "three fs" do
      actual = Conversion.hex_to_base64("fff")
      expected = "//"

      assert(actual == expected)
    end
  end

  describe "bitstring_to_hex" do
    def assert_bitstring_to_hex_eq(bitstring, hexstring) do
      actual = Conversion.bitstring_to_hex(bitstring)
      expected = hexstring

      assert(actual == expected)
    end

    test "one 0" do
      assert_bitstring_to_hex_eq(<<0::4>>, "0")
    end

    test "one 9" do
      assert_bitstring_to_hex_eq(<<9::4>>, "9")
    end

    test "one C" do
      assert_bitstring_to_hex_eq(<<0xC::4>>, "c")
    end

    test "a 1 and 2" do
      assert_bitstring_to_hex_eq(<<1::4, 2::4>>, "12")
    end

    test "a few digits" do
      assert_bitstring_to_hex_eq(<<4::4, 0xA::4, 0xD::4, 3::4>>, "4ad3")
    end

    test "back and forth" do
      input = "abc123"
      actual = Conversion.hex_to_bitstring(input) |> Conversion.bitstring_to_hex()
      assert(actual == input)
    end
  end
end
