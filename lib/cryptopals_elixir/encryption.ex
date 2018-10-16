defmodule CryptopalsElixir.Encryption do
  alias CryptopalsElixir.Operations

  def xor_cypher(<<input::8>>, <<key::8>>),
    do: Operations.fixed_xor(<<input::8>>, <<key::8>>)
end
