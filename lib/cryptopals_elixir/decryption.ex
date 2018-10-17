defmodule CryptopalsElixir.Decryption do
  defmodule EnglishScoring do
    def score(string) when is_binary(string) do
      total =
        string
        |> String.graphemes()
        |> Enum.map(&letter_weight/1)
        |> Enum.sum()

      total / String.length(string)
    end

    def letter_weight(char) when is_binary(char) do
      case String.upcase(char) do
        "E" -> 12
        "T" -> 11
        "A" -> 10
        "O" -> 9
        "I" -> 8
        "N" -> 7
        "S" -> 6
        "H" -> 5
        "R" -> 4
        "D" -> 3
        "L" -> 2
        "U" -> 1
        _ -> 0
      end
    end
  end
end
