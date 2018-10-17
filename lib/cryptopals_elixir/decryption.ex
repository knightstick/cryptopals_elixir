defmodule CryptopalsElixir.Decryption do
  def score_xor_key_likelihoods(encrypted_string) do
    %{<<0::8>> => CryptopalsElixir.Decryption.EnglishScoring.score(encrypted_string)}
  end
end
