defmodule CryptopalsElixir.Operations do
  def fixed_xor(<<0::1>>, <<0::1>>), do: <<0::1>>
  def fixed_xor(<<0::1>>, <<1::1>>), do: <<1::1>>
  def fixed_xor(<<1::1>>, <<0::1>>), do: <<1::1>>
  def fixed_xor(<<1::1>>, <<1::1>>), do: <<0::1>>

  def fixed_xor(<<head_1::1, tail_1::1>>, <<head_2::1, tail_2::1>>) do
    <<fixed_xor(<<head_1::1>>, <<head_2::1>>)::bitstring,
      fixed_xor(<<tail_1::1>>, <<tail_2::1>>)::bitstring>>
  end

  def fixed_xor(<<head_1::1, tail_1::bitstring>>, <<head_2::1, tail_2::bitstring>>) do
    <<fixed_xor(<<head_1::1>>, <<head_2::1>>)::bitstring,
      fixed_xor(<<tail_1::bitstring>>, <<tail_2::bitstring>>)::bitstring>>
  end
end
