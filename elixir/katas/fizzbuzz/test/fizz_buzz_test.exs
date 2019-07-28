defmodule FizzBuzzTest do
  use ExUnit.Case
  import FizzBuzz

  test "when passed a number that number is returned" do
    assert fizz(1) == 1
  end

  test "when passed a mulitple three, fizz is returned" do
    assert fizz(3) == "fizz"
    assert fizz(633) == "fizz"
  end

  test "when passed a multiple of five, buzz is returned" do
    assert fizz(5) == "buzz"
    assert fizz(39852365) == "buzz"
  end

  test "when passed a multiple of three and fice, fizzbuzz is returned" do
    assert fizz(15) == "fizzbuzz"
  end
end
