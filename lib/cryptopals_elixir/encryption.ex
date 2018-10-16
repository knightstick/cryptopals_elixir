defmodule CryptopalsElixir.Encryption do
  def xor_cypher(<<?a::8>>, <<0::8>>), do: <<?a::8>>
end
