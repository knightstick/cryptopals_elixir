defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}
  alias Decryption.EnglishScoring

  def score_xor_key_likelihoods(input) do
    [<<0::8>>, <<1::8>>, <<250::8>>]
    |> Enum.reduce(%{}, fn key, acc ->
      Map.put(acc, key, score_xor_key(input, key))
    end)
  end

  defp score_xor_key(string, key) do
    string
    |> Encryption.xor_cypher(key)
    |> EnglishScoring.score()
  end
end
