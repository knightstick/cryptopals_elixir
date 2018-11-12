defmodule CryptopalsElixirTest do
  use ExUnit.Case
  doctest CryptopalsElixir

  test "hex to base64" do
    input =
      "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

    output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    assert CryptopalsElixir.hex_to_base64(input) == output
  end

  test "fixed XOR" do
    input_1 = "1c0111001f010100061a024b53535009181c"
    input_2 = "686974207468652062756c6c277320657965"
    expected = "746865206b696420646f6e277420706c6179"

    assert CryptopalsElixir.fixed_xor(input_1, input_2) == expected
  end

  test "decrypting single-byte xor cypher with score" do
    original =
      "To recap, it is *vital* that you stay in your homes. Make no attempt to reach loved ones, and avoid all physical contact with the assailants."

    encrypted =
      original
      |> CryptopalsElixir.Encryption.xor_cypher(<<123::8>>)
      |> CryptopalsElixir.Conversion.bitstring_to_hex()

    %{decrypted: decrypted, score: score} =
      CryptopalsElixir.decrypt_xor_cypher_with_score(encrypted)

    assert decrypted == original
    assert score == CryptopalsElixir.Decryption.score_xor_key(original, <<0::8>>)
  end

  test "decrypting one line from file" do
    original =
      "Don't wanna be your monkey wrench, one more indecent accident, I'd rather leave than suffer this, I'll never be your monkey wrench"

    encrypted =
      original
      |> CryptopalsElixir.Encryption.xor_cypher(<<251::8>>)
      |> CryptopalsElixir.Conversion.bitstring_to_hex()

    noise =
      for _ <- 0..5, into: [] do
        for _ <- 0..80, into: "", do: <<Enum.random(0..255)::8>>
      end

    file_contents = Enum.shuffle(noise ++ [encrypted])
    file_path = Path.relative("tmp.txt")
    File.touch!(file_path)
    File.write!(file_path, file_contents)
    File.rm!(file_path)
  end
end
