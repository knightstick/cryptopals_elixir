defmodule CryptopalsElixir do
  def hex_to_base64(hexstring), do: CryptopalsElixir.Conversion.hex_to_base64(hexstring)

  def fixed_xor(hexstring_1, hexstring_2) do
    bitstring_1 = CryptopalsElixir.Conversion.hex_to_bitstring(hexstring_1)
    bitstring_2 = CryptopalsElixir.Conversion.hex_to_bitstring(hexstring_2)
    xored = CryptopalsElixir.Operations.fixed_xor(bitstring_1, bitstring_2)

    CryptopalsElixir.Conversion.bitstring_to_hex(xored)
  end

  def decrypt_xor_cypher(encrypted_hexstring) do
    %{decrypted: decrypted, score: _score} =
      encrypted_hexstring
      |> CryptopalsElixir.Conversion.hex_to_bitstring()
      |> CryptopalsElixir.Decryption.decrypt_xor_cypher()

    decrypted
  end

  def decrypt_xor_cypher_with_score(encrypted_hexstring) do
    encrypted_hexstring
    |> CryptopalsElixir.Conversion.hex_to_bitstring()
    |> CryptopalsElixir.Decryption.decrypt_xor_cypher_with_score()
  end
end
