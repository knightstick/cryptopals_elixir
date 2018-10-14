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

  defp codepoints_to_bitstring(list) when is_list(list) do
    list
    |> Enum.reduce(<<>>, fn codepoint, bitstring ->
      <<bits::4>> = hex_to_bitstring(codepoint)
      <<(<<bitstring::bitstring>>), (<<bits::4>>)>>
    end)
  end

  @base64translations "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  def bitstring_to_base64(<<n::6>>) when n >= 0 and n <= 63 do
    @base64translations
    |> String.graphemes()
    |> Enum.at(n)
  end

  def bitstring_to_base64(<<x::6, tail::bitstring>>),
    do: bitstring_to_base64(<<x::6>>) <> bitstring_to_base64(<<tail::bitstring>>)
end
