defmodule CryptopalsElixir.OperationsTest do
  use ExUnit.Case
  doctest CryptopalsElixir.Operations

  describe "fixed_xor" do
    def assert_fixed_xor_eq({input_1, input_2}, output) do
      actual = CryptopalsElixir.Operations.fixed_xor(input_1, input_2)
      expected = output

      assert(actual == expected)
    end

    test "two 1 bit zeros" do
      assert_fixed_xor_eq({<<0::1>>, <<0::1>>}, <<0::1>>)
    end

    test "one 0 and one 1" do
      assert_fixed_xor_eq({<<0::1>>, <<1::1>>}, <<1::1>>)
    end

    test "one 1 and one 0" do
      assert_fixed_xor_eq({<<1::1>>, <<0::1>>}, <<1::1>>)
    end

    test "two ones" do
      assert_fixed_xor_eq({<<1::1>>, <<1::1>>}, <<0::1>>)
    end

    test "all zeroes and all ones" do
      assert_fixed_xor_eq({<<0b00::2>>, <<0b11::2>>}, <<0b11::2>>)
    end

    test "all zeroes and all zeroes" do
      assert_fixed_xor_eq({<<0b00::2>>, <<0b00::2>>}, <<0b00::2>>)
    end

    test "three bits mixed" do
      assert_fixed_xor_eq({<<0b101::3>>, <<0b100::3>>}, <<0b001::3>>)
    end
  end
end
