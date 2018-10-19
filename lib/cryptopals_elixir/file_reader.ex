defmodule CryptopalsElixir.FileReader do
  def hex_file_to_bitstrings(path) do
    path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn hex -> CryptopalsElixir.Conversion.hex_to_bitstring(hex) end)
  end
end
