defmodule CryptopalsElixir.DecryptionTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Decryption

  alias CryptopalsElixir.{Decryption, Encryption}

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

    test "top 12 letters" do
      actual =
        "etaoinshrdlu"
        |> String.graphemes()
        |> Enum.map(&Decryption.EnglishScoring.letter_weight/1)

      assert actual == [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    end

    test "other letters score 0" do
      assert(Decryption.EnglishScoring.letter_weight("x") == 0)
    end

    test "uppercase E scores the same as lowercase e" do
      assert(Decryption.EnglishScoring.letter_weight("E") == 12)
    end

    test "uppercase U scores the same as lowercase u" do
      assert(Decryption.EnglishScoring.letter_weight("U") == 1)
    end
  end

  describe "score" do
    test "single E scores 12" do
      assert(Decryption.EnglishScoring.score("E") == 12.0)
    end

    test "single s scores 6" do
      assert(Decryption.EnglishScoring.score("s") == 6.0)
    end

    test "two of the same char scores the same as one" do
      assert(Decryption.EnglishScoring.score("dd") == 3.0)
    end

    test "scores the average of the letter weights" do
      assert(Decryption.EnglishScoring.score("shr") == 5.0)
    end

    test "an English sentence scores higher than a xored one" do
      input =
        "As Bertrand Russell said the only thing that will redeem mankind is co-operation. I think we can all appreciate that now"

      xor_key = <<0b10101010::8>>

      original_score = Decryption.EnglishScoring.score(input)

      xored_score =
        input
        |> Encryption.xor_cypher(xor_key)
        |> Decryption.EnglishScoring.score()

      assert(original_score > xored_score)
    end
  end

  describe "score_xor_key_likelihoods" do
    test "scoring 0" do
      input = "Hello" |> Encryption.xor_cypher(<<12::8>>)

      %{<<0::8>> => zero_score} = Decryption.score_xor_key_likelihoods(input)

      assert(zero_score == Decryption.EnglishScoring.score(input))
    end

    test "scoring 1" do
      input = "Hello" |> Encryption.xor_cypher(<<80::8>>)

      %{<<1::8>> => score} = Decryption.score_xor_key_likelihoods(input)

      expected_score =
        input
        |> Encryption.xor_cypher(<<1::8>>)
        |> Decryption.EnglishScoring.score()

      assert(score == expected_score)
    end

    test "scoring 250" do
      input = "Hello" |> Encryption.xor_cypher(<<96::8>>)

      %{<<250::8>> => score} = Decryption.score_xor_key_likelihoods(input) |> IO.inspect()

      expected_score =
        input
        |> Encryption.xor_cypher(<<250::8>>)
        |> Decryption.EnglishScoring.score()

      assert(score == expected_score)
    end
  end
end
