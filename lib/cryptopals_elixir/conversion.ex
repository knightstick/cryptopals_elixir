defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::8>>
      :error -> raise ArgumentError
    end
  end

  def hex_to_bytes("0" <> char), do: <<0::8>> <> hex_to_bytes(char)

  def hex_to_bytes([char]), do: hex_to_bytes(char)

  def hex_to_bytes(string) when is_binary(string) do
    [head | tail] = String.codepoints(string)
    hex_to_bytes(head) <> hex_to_bytes(tail)
  end
end
