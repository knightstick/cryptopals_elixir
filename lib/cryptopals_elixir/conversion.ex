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

  def bitstring_to_base64(<<0::6>>), do: "A"
end
