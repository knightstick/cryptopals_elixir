defmodule CryptopalsElixir.Encryption do
  def xor_cypher(<<input::8>>, <<key::8>>),
    do: CryptopalsElixir.Operations.fixed_xor(<<input::8>>, <<key::8>>)

  def xor_cypher(input, key), do: CryptopalsElixir.Operations.fixed_xor(input, key)
end
