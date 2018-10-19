defmodule CryptopalsElixir.FileReaderTest do
  use ExUnit.Case
  doctest CryptopalsElixir.FileReader

  describe "reading hex strings" do
    def fixture_path(), do: Path.expand("fixtures", __DIR__)

    def read_hex_file_from_fixture(filename) do
      file_path = Path.join(fixture_path(), filename)
      CryptopalsElixir.FileReader.hex_file_to_bitstrings(file_path)
    end

    test "one zero in file" do
      read_bitstrings = read_hex_file_from_fixture("zero_hex.txt")
      expected = [<<0::4>>]

      assert(read_bitstrings == expected)
    end

    test "one f in file" do
      read_bitstrings = read_hex_file_from_fixture("one_f_hex.txt")
      expected = [<<0xF::4>>]

      assert(read_bitstrings == expected)
    end

    test "abc in file" do
      read_bitstrings = read_hex_file_from_fixture("abc_hex.txt")
      expected = [<<0xA::4, 0xB::4, 0xC::4>>]

      assert(read_bitstrings == expected)
    end
  end
end
