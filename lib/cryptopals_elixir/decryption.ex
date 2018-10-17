defmodule CryptopalsElixir.Decryption do
  def score_xor_key_likelihoods(encrypted_string) do
    %{
      <<0::8>> => CryptopalsElixir.Decryption.EnglishScoring.score(encrypted_string),
      <<1::8>> =>
        CryptopalsElixir.Decryption.EnglishScoring.score(
          encrypted_string
          |> CryptopalsElixir.Encryption.xor_cypher(<<1::8>>)
        )
    }
  end
end
