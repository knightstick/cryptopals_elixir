defmodule CryptopalsElixir.OperationsTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Operations

  describe "fixed_xor" do
    test "two 1 bit zeros" do
      actual = CryptopalsElixir.Operations.fixed_xor(<<0::1>>, <<0::1>>)
      expected = <<0::1>>

      assert(actual == expected)
    end

    test "one 0 and one 1" do
      actual = CryptopalsElixir.Operations.fixed_xor(<<0::1>>, <<1::1>>)
      expected = <<1::1>>
      assert(actual == expected)
    end
  end
end
