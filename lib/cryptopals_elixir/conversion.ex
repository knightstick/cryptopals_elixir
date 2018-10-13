defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::8>>
      :error -> raise ArgumentError
    end
  end

  def hex_to_bytes([char]), do: hex_to_bytes(char)

  def hex_to_bytes(string) when is_binary(string) do
    [head | tail] = String.codepoints(string)
    codepoints_to_bytes([head]) <> codepoints_to_bytes(tail)
  end

  def codepoints_to_bytes([codepoint]), do: hex_to_bytes(codepoint)
end
