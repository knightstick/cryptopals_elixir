defmodule CryptopalsElixir.EncryptionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Encryption

  alias CryptopalsElixir.Encryption

  describe "xor_cypher" do
    def assert_xor_cypher_eq({input, xor_key}, expected) do
      assert Encryption.xor_cypher(input, xor_key) == expected
    end

    test "1 byte against 0" do
      assert_xor_cypher_eq({<<?a::8>>, <<0::8>>}, <<?a::8>>)
    end

    test "another byte against 0" do
      assert_xor_cypher_eq({<<?z::8>>, <<0::8>>}, <<?z::8>>)
    end

    test "zero against a byte" do
      assert_xor_cypher_eq({<<0::8>>, <<?!::8>>}, <<?!::8>>)
    end
  end
end
