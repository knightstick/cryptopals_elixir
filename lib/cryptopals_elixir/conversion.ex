defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes("0"), do: <<0::size(8)>>
  def hex_to_bytes("1"), do: <<1::size(8)>>
  def hex_to_bytes("2"), do: <<2::size(8)>>

  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::size(8)>>
      :error -> raise ArgumentError
    end
  end
end
