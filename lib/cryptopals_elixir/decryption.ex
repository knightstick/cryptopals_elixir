defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}
  alias Decryption.EnglishScoring

  def decrypt_xor_cypher(input), do: decrypt_xor_cypher_with_score(input)

  def decrypt_xor_cypher_with_score(input) do
    {xor_key, score} =
      score_xor_key_likelihoods(input)
      |> Enum.max_by(fn {_key, score} ->
        score
      end)

    %{key: xor_key, decrypted: Encryption.xor_cypher(input, xor_key), score: score}
  end

  def score_xor_key_likelihoods(input) do
    Enum.reduce(all_byte_combinations(), %{}, fn key, acc ->
      Map.put(acc, key, score_xor_key(input, key))
    end)
  end

  def score_xor_key(string, key) do
    string
    |> Encryption.xor_cypher(key)
    |> EnglishScoring.score()
  end

  defp all_byte_combinations do
    for x <- 0b00000000..0b11111111, into: [], do: <<x::8>>
  end
end
