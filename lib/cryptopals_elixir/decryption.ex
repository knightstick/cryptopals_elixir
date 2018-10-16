defmodule CryptopalsElixir.Decryption do
  defmodule EnglishScoring do
    def letter_weight("e"), do: 12
    def letter_weight("t"), do: 11
    def letter_weight("a"), do: 10
    def letter_weight("o"), do: 9
    def letter_weight("i"), do: 8
    def letter_weight("n"), do: 7
    def letter_weight("s"), do: 6
    def letter_weight("h"), do: 5
    def letter_weight("r"), do: 4
    def letter_weight("d"), do: 3
    def letter_weight("l"), do: 2
    def letter_weight("u"), do: 1

    def letter_weight(char) when is_binary(char) and byte_size(char) == 1 do
      case String.upcase(char) do
        "E" -> 12
        _ -> 0
      end
    end
  end
end
