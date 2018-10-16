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

    test "two actual bytes" do
      # 01100001 and 01100010 => 00000011
      assert_xor_cypher_eq({"a", "b"}, <<3::8>>)
    end

    test "two bytes against one" do
      assert_xor_cypher_eq({<<0::8, 0::8>>, <<0::8>>}, <<0::8, 0::8>>)
    end

    test "three bytes against one" do
      assert_xor_cypher_eq(
        {<<0b00000000::8, 0b00001111::8, 0b01010101>>, <<0b11110000>>},
        <<0b11110000::8, 0b11111111::8, 0b10100101::8>>
      )
    end
  end
end
