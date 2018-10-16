defmodule CryptopalsElixir.Encryption do
  def xor_cypher(input, key), do: CryptopalsElixir.Operations.fixed_xor(input, key)
end
