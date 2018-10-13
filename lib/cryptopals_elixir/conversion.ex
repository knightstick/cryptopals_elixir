defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::8>>
      :error -> raise ArgumentError
    end
  end

  def hex_to_bytes(string) when is_binary(string) do
    string
    |> String.codepoints()
    |> codepoints_to_bytes()
  end

  def codepoints_to_bytes([codepoint]), do: hex_to_bytes(codepoint)
  def codepoints_to_bytes([first, second]), do: hex_to_bytes(first) <> hex_to_bytes(second)
end
