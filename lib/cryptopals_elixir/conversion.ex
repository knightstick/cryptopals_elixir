defmodule CryptopalsElixir.Conversion do
  def hex_to_bitstring(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::4>>
      :error -> raise ArgumentError
    end
  end

  def hex_to_bitstring(string) when is_binary(string) do
    string
    |> String.codepoints()
    |> codepoints_to_bitstring()
  end

  def codepoints_to_bitstring(list) when is_list(list) do
    list
    |> Enum.reduce(<<>>, fn codepoint, bitstring ->
      bitstring <> hex_to_bitstring(codepoint)
    end)
  end

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

  def codepoints_to_bytes(list) when is_list(list) do
    list
    |> Enum.reduce(<<>>, fn codepoint, bytes ->
      bytes <> hex_to_bytes(codepoint)
    end)
  end
end
