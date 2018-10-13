defmodule CryptopalsElixir.Conversion do
  def hex_to_bytes(char) when is_binary(char) and byte_size(char) == 1 do
    case Integer.parse(char, 16) do
      {int, _} -> <<int::size(8)>>
      :error -> raise ArgumentError
    end
  end
end
