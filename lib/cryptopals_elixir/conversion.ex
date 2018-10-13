defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes("0"), do: <<0::size(8)>>
  def hex_to_bytes("1"), do: <<1::size(8)>>
  def hex_to_bytes("2"), do: <<2::size(8)>>

  def hex_to_bytes(char) when is_list(char) and length(char) == 1 do
    {int, _} = Integer.parse(char)
    <<int::size(8)>>
  end
end
