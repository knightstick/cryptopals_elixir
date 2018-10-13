defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes("0"), do: <<0::size(8)>>
  def hex_to_bytes("1"), do: <<1::size(8)>>
  def hex_to_bytes("2"), do: <<2::size(8)>>

  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    with {int, _} = Integer.parse(char) do
      <<int::size(8)>>
    else
      _ -> nil
    end
  end
end
