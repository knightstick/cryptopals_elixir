defmodule CryptopalsElixirTest do
  use ExUnit.Case
  doctest CryptopalsElixir

  test "hex to base64" do
    input =
      "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

    output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    assert CryptopalsElixir.hex_to_base64(input) == output
  end

  test "fixed XOR" do
    input_1 = "1c0111001f010100061a024b53535009181c"
    input_2 = "686974207468652062756c6c277320657965"
    expected = "746865206b696420646f6e277420706c6179"

    assert CryptopalsElixir.fixed_xor(input_1, input_2) == expected
  end
end
