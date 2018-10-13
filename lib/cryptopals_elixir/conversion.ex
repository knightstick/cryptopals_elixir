defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::8>>
      :error -> raise ArgumentError
    end
  end

  def hex_to_bytes("00"), do: <<0::8, 0::8>>
  def hex_to_bytes("0" <> char), do: <<0::8>> <> hex_to_bytes(char)
end
