defmodule CryptopalsElixir.Encryption do
  alias CryptopalsElixir.Operations

  def xor_cypher(<<input::8>>, <<key::8>>),
    do: Operations.fixed_xor(<<input::8>>, <<key::8>>)

  def xor_cypher(<<head::8, tail::bitstring>>, <<key::8>>) do
    <<new_tail::bitstring>> = xor_cypher(<<tail::bitstring>>, <<key::8>>)
    <<(<<Operations.fixed_xor(<<head::8>>, <<key::8>>)::bitstring>>), (<<new_tail::bitstring>>)>>
  end
end
