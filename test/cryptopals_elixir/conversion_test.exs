defmodule CryptopalsElixir.ConversionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Conversion

  alias CryptopalsElixir.Conversion

  def assert_converts_hex_to_bytes(string, bytes) do
    assert(Conversion.hex_to_bytes(string) == bytes)
  end

  test "converting a single char to bytes" do
    assert_converts_hex_to_bytes("0", <<0::8>>)
  end

  test "converting a 1 to bytes" do
    actual = Conversion.hex_to_bytes("1")
    expected = <<1::8>>

    assert(actual == expected)
  end

  test "converting a 2 to bytes" do
    actual = Conversion.hex_to_bytes("2")
    expected = <<2::8>>

    assert(actual == expected)
  end

  test "raises an error if the string is not hex" do
    assert_raise(ArgumentError, fn ->
      Conversion.hex_to_bytes("x")
    end)
  end

  test "converting an a to a byte" do
    actual = Conversion.hex_to_bytes("a")
    expected = <<10::8>>

    assert(actual == expected)
  end

  test "converting an f to a byte" do
    actual = Conversion.hex_to_bytes("f")
    expected = <<15::8>>

    assert(actual == expected)
  end

  test "converting two 0s to bytes" do
    actual = Conversion.hex_to_bytes("00")
    expected = <<0::8, 0::8>>

    assert(actual == expected)
  end

  test "converting a 0 and a 1" do
    actual = Conversion.hex_to_bytes("01")
    expected = <<0::8, 1::8>>

    assert(actual == expected)
  end

  test "converting a 1 and a 1" do
    actual = Conversion.hex_to_bytes("11")
    expected = <<1::8, 1::8>>

    assert(actual == expected)
  end

  test "converting a 2 and a b" do
    actual = Conversion.hex_to_bytes("2b")
    expected = <<2::8, 11::8>>

    assert(actual == expected)
  end

  test "converting 3 char string" do
    actual = Conversion.hex_to_bytes("abc")
    expected = <<10::8, 11::8, 12::8>>

    assert(actual == expected)
  end

  test "a blank string" do
    actual = Conversion.hex_to_bytes("")
    expected = <<>>

    assert(actual == expected)
  end
end
