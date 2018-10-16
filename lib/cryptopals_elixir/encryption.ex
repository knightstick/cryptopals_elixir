defmodule CryptopalsElixir.Encryption do
  def xor_cypher(<<0::8>>, <<byte::8>>), do: <<byte::8>>
  def xor_cypher(<<byte::8>>, <<0::8>>), do: <<byte::8>>
  def xor_cypher(input, key), do: CryptopalsElixir.Operations.fixed_xor(input, key)
end
