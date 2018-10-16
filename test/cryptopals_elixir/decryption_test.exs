defmodule CryptopalsElixir.DecryptionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Decryption

  alias CryptopalsElixir.Decryption

  describe "letter_weights" do
    test "e scores best" do
      assert(Decryption.EnglishScoring.letter_weight("e") == 12)
    end

    test "a few letters" do
      actual =
        "etaoin"
        |> String.graphemes()
        |> Enum.map(&Decryption.EnglishScoring.letter_weight/1)

      assert actual == [12, 11, 10, 9, 8, 7]
    end
  end
end
