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
      assert(<<0::4, 0::4>> == <<0::8>>)
    end
  end

  describe "hex_to_bytes" do
    def assert_converts_hex_to_bytes(string, bytes) do
      assert(Conversion.hex_to_bytes(string) == bytes)
    end

    test "converting a single char to bytes" do
      assert_converts_hex_to_bytes("0", <<0::8>>)
    end

    test "converting a 1 to bytes" do
      assert_converts_hex_to_bytes("1", <<1::8>>)
    end

    test "converting a 2 to bytes" do
      assert_converts_hex_to_bytes("2", <<2::8>>)
    end

    test "raises an error if the string is not hex" do
      assert_raise(ArgumentError, fn ->
        Conversion.hex_to_bytes("x")
      end)
    end

    test "converting an a to a byte" do
      assert_converts_hex_to_bytes("a", <<10::8>>)
    end

    test "converting an f to a byte" do
      assert_converts_hex_to_bytes("f", <<15::8>>)
    end

    test "converting two 0s to bytes" do
      assert_converts_hex_to_bytes("00", <<0::8, 0::8>>)
    end

    test "converting a 0 and a 1" do
      assert_converts_hex_to_bytes("01", <<0::8, 1::8>>)
    end

    test "converting a 1 and a 1" do
      assert_converts_hex_to_bytes("11", <<1::8, 1::8>>)
    end

    test "converting a 2 and a b" do
      assert_converts_hex_to_bytes("2b", <<2::8, 11::8>>)
    end

    test "converting 3 char string" do
      assert_converts_hex_to_bytes("abc", <<10::8, 11::8, 12::8>>)
    end

    test "a blank string" do
      assert_converts_hex_to_bytes("", <<>>)
    end
  end
end
