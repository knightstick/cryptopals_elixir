defmodule CryptopalsElixir.Encryption do
  def xor_cypher(<<byte::8>>, <<0::8>>), do: <<byte::8>>
end
