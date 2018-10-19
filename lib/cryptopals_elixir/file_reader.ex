defmodule CryptopalsElixir.FileReader do
  def hex_file_to_bitstrings(path) do
    bitstring =
      path
      |> File.read!()
      |> String.trim()
      |> CryptopalsElixir.Conversion.hex_to_bitstring()

    [bitstring]
  end
end
