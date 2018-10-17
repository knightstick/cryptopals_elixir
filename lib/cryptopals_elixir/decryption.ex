defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}

  def score_xor_key_likelihoods(encrypted_string) do
    %{
      <<0::8>> => score_xor_key(encrypted_string, <<0::8>>),
      <<1::8>> => score_xor_key(encrypted_string, <<1::8>>)
    }
  end

  defp score_xor_key(string, key) do
    string
    |> Encryption.xor_cypher(key)
    |> Decryption.EnglishScoring.score()
  end
end
