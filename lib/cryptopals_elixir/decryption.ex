defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}
  alias Decryption.EnglishScoring

  def score_xor_key_likelihoods(input) do
    Enum.reduce(all_byte_combinations(), %{}, fn key, acc ->
      Map.put(acc, key, score_xor_key(input, key))
    end)
  end

  defp all_byte_combinations do
    0b00000000..0b11111111
    |> Enum.map(fn x -> <<x::8>> end)
  end

  defp score_xor_key(string, key) do
    string
    |> Encryption.xor_cypher(key)
    |> EnglishScoring.score()
  end
end
