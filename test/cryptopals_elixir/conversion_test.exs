defmodule CryptopalsElixir.ConversionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Conversion

  test "converting a single char to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("0")
    expected = <<0::8>>

    assert(actual == expected)
  end

  test "converting a 1 to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("1")
    expected = <<1::8>>

    assert(actual == expected)
  end

  test "converting a 2 to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("2")
    expected = <<2::8>>

    assert(actual == expected)
  end

  test "raises an error if the string is not hex" do
    assert_raise(ArgumentError, fn ->
      CryptopalsElixir.Conversion.hex_to_bytes("x")
    end)
  end

  test "converting an a to a byte" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("a")
    expected = <<10::8>>

    assert(actual == expected)
  end

  test "converting an f to a byte" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("f")
    expected = <<15::8>>

    assert(actual == expected)
  end

  test "converting two 0s to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("00")
    expected = <<0::8, 0::8>>

    assert(actual == expected)
  end

  test "converting a 0 and a 1" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("01")
    expected = <<0::8, 1::8>>

    assert(actual == expected)
  end
end
