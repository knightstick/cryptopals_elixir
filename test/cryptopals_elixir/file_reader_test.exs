defmodule CryptopalsElixir.FileReaderTest do
  use ExUnit.Case
  doctest CryptopalsElixir.FileReader

  describe "reading hex strings" do
    fixture_path = Path.expand("fixtures", __DIR__)
    file_path = Path.join(fixture_path, "zero_hex.txt")
    read_bitstrings = CryptopalsElixir.FileReader.hex_file_to_bitstrings(file_path)
    expected = [<<0::8>>]

    assert(read_bitstrings == expected)
  end
end
