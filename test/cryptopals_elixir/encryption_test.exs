defmodule CryptopalsElixir.EncryptionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Encryption

  alias CryptopalsElixir.Encryption

  describe "xor_cypher" do
    def assert_xor_cypher_eq({input, xor_key}, expected) do
      assert Encryption.xor_cypher(input, xor_key) == expected
    end

    test "1 byte against 0" do
      input = <<?a::8>>
      xor_key = <<0::8>>
      actual = Encryption.xor_cypher(input, xor_key)
      expected = <<?a::8>>
      assert(actual == expected)
      assert_xor_cypher_eq({input, xor_key}, expected)
    end

    test "another byte against 0" do
      input = <<?z::8>>
      xor_key = <<0::8>>
      actual = Encryption.xor_cypher(input, xor_key)
      expected = <<?z::8>>
      assert(actual == expected)
    end

    test "zero against a byte" do
      input = <<0::8>>
      xor_key = <<?!::8>>
      actual = Encryption.xor_cypher(input, xor_key)
      expected = <<?!::8>>
      assert(actual == expected)
    end
  end
end
