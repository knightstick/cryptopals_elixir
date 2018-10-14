defmodule CryptopalsElixir.Operations do
  def fixed_xor(_input_1, <<0::1>>), do: <<0::1>>
  def fixed_xor(_input_1, <<1::1>>), do: <<1::1>>
end
