defmodule CryptopalsElixir.Decryption do
  defmodule EnglishScoring do
    def letter_weight("e"), do: 12
    def letter_weight("t"), do: 11
    def letter_weight("a"), do: 10
    def letter_weight("o"), do: 9
    def letter_weight("i"), do: 8
    def letter_weight("n"), do: 7
  end
end
