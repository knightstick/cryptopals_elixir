defmodule CryptopalsElixirTest do
  use ExUnit.Case
  doctest CryptopalsElixir

  test "hex to base64" do
    input =
      "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

    output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    assert CryptopalsElixir.hex_to_base64(input) == output
  end
end
