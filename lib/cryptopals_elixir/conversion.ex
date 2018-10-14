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

  @uppercase_alphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  def bitstring_to_base64(<<n::6>>) when n >= 0 and n <= 25 do
    @uppercase_alphabet
    |> String.graphemes()
    |> Enum.at(n)
  end

  @lowercase_alphabet "abcdefghijklmnopqrstuvwxyz"
  def bitstring_to_base64(<<n::6>>) when n >= 26 and n <= 51 do
    @lowercase_alphabet
    |> String.graphemes()
    |> Enum.at(n - 26)
  end

  def bitstring_to_base64(<<n::6>>) when n >= 52 and n <= 61, do: to_string(n - 52)

  def bitstring_to_base64(<<62::6>>), do: "+"
  def bitstring_to_base64(<<63::6>>), do: "/"

  def bitstring_to_base64(<<x::6, x::6>>),
    do: bitstring_to_base64(<<x::6>>) <> bitstring_to_base64(<<x::6>>)

  def bitstring_to_base64(<<x::6, y::6>>),
    do: bitstring_to_base64(<<x::6>>) <> bitstring_to_base64(<<y::6>>)
end
