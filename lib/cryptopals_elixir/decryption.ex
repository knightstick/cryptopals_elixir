defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}
  alias Decryption.EnglishScoring

  def score_xor_key_likelihoods(input) do
    %{
      <<0::8>> => score_xor_key(input, <<0::8>>),
      <<1::8>> => score_xor_key(input, <<1::8>>)
    }
  end

  defp score_xor_key(string, key) do
    string
    |> Encryption.xor_cypher(key)
    |> EnglishScoring.score()
  end
end
