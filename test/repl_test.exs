defmodule ReplTest do
  use ExUnit.Case
  doctest R

  test "hex" do
    IO.puts("")
    assert R.hex(10, false) == "A"
  end

  test "random_string" do
    IO.puts("")

    str1 = R.random_string(20)
    assert String.length(str1) == 20
    assert str1 != R.random_string(20)

    for n <- 1..10 do
      assert String.length(R.random_string(n)) == n
    end

    for _ <- 1..3 do
      str_number_only = R.random_string(30, alphabet: false)
      assert Regex.match?(~r/^\d{30}$/, str_number_only)
    end

    for _ <- 1..3 do
      str_lower_only = R.random_string(30, upper: false, number: false)
      assert Regex.match?(~r/^[a-z]{30}$/, str_lower_only)
    end

    for _ <- 1..3 do
      str_upper_only = R.random_string(30, lower: false, number: false)
      assert Regex.match?(~r/^[A-Z]{30}$/, str_upper_only)
    end

    for _ <- 1..3 do
      str_special_only = R.random_string(30, alphabet: false, number: false, special: 'abc./=')
      assert Regex.match?(~r"^[abc./=]{30}$", str_special_only)
    end
  end
end
