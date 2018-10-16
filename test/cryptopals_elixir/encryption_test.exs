defmodule CryptopalsElixir.EncryptionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Encryption

  alias CryptopalsElixir.Encryption

  describe "xor_cypher" do
    test "encrypting one byte with 0" do
      input = <<?a::8>>
      xor_key = <<0::8>>
      actual = Encryption.xor_cypher(input, xor_key)
      expected = <<?a::8>>
      assert(actual == expected)
    end
  end
end
