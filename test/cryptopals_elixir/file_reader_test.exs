defmodule CryptopalsElixir.FileReaderTest do
  use ExUnit.Case
  doctest CryptopalsElixir.FileReader

  describe "reading hex strings" do
    fixture_path = Path.expand("fixtures", __DIR__)
    file_path = Path.join(fixture_path, "zero_hex.txt")
    assert "0\n" == File.read!(file_path) |> IO.inspect()
  end
end
