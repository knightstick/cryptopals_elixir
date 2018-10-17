defmodule CryptopalsElixir.Decryption do
  alias CryptopalsElixir.{Decryption, Encryption}

  def score_xor_key_likelihoods(encrypted_string) do
    %{
      <<0::8>> =>
        Decryption.EnglishScoring.score(
          encrypted_string
          |> Encryption.xor_cypher(<<0::8>>)
        ),
      <<1::8>> =>
        Decryption.EnglishScoring.score(
          encrypted_string
          |> Encryption.xor_cypher(<<1::8>>)
        )
    }
  end
end
