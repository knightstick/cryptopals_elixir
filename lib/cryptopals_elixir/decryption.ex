defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}

  def score_xor_key_likelihoods(encrypted_string) do
    %{
      <<0::8>> => score_xor_key(encrypted_string, <<0::8>>),
      <<1::8>> => score_xor_key(encrypted_string, <<1::8>>)
    }
  end

  defp score_xor_key(string, key) do
    Decryption.EnglishScoring.score(string |> Encryption.xor_cypher(key))
  end
end
