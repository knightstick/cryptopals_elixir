defmodule CryptopalsElixir.Encryption do
  alias CryptopalsElixir.Operations

  def xor_cypher(<<input::8>>, <<key::8>>),
    do: Operations.fixed_xor(<<input::8>>, <<key::8>>)

  def xor_cypher(<<head::8, tail::8>>, <<key::8>>) do
    <<new_head::bitstring>> = Operations.fixed_xor(<<head::8>>, <<key::8>>)
    <<new_tail::bitstring>> = Operations.fixed_xor(<<tail::8>>, <<key::8>>)
    <<(<<new_head::bitstring>>), (<<new_tail::bitstring>>)>>
  end
end
