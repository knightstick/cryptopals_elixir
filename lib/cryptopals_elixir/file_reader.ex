defmodule CryptopalsElixir.FileReader do
  alias CryptopalsElixir.Conversion

  def hex_file_to_bitstrings(path) do
    path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&Conversion.hex_to_bitstring/1)
  end
end
