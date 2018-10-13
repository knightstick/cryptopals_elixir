defmodule CryptopalsElixir.ConversionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Conversion

  test "converting a single char to bytes" do
    actual = CryptopalsElixir.Conversion.hex_to_bytes("0")
    expected =  <<0 :: size(8)>>

    assert(actual == expected)
  end
end
