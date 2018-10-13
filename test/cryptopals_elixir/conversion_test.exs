defmodule CryptopalsElixir.ConversionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Conversion

  test "converting a single char to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("0")
    expected = <<0::size(8)>>

    assert(actual == expected)
  end

  test "converting a 1 to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("1")
    expected = <<1::size(8)>>

    assert(actual == expected)
  end

  test "converting a 2 to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("2")
    expected = <<2::size(8)>>

    assert(actual == expected)
  end

  test "raises an error if the string is not hex" do
    assert_raise(ArgumentError, fn ->
      CryptopalsElixir.Conversion.hex_to_bytes("x")
    end)
  end

  test "converting an a to a byte" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("a")
    expected = <<10::size(8)>>

    assert(actual == expected)
  end
end
