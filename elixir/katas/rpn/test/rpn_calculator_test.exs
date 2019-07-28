defmodule RPNCalculatorTest do
  use ExUnit.Case
  import RPNCalculator

  test "given a number that number is returned" do
    assert calculate("5") == 5
  end

  test "given single addition operation, sum of two numbers is returned" do
    assert calculate("5 6 +") == 11
  end

  test "given single subtraction operation, the difference of two numbers is returned" do
    assert calculate("9 5 -") == 4
  end

  test "given a single multiplication operation the product of the two numbers is returned" do
    assert calculate("2 5 *") == 10
  end

  test "given a single division operation, the quotient of the two numbers is returned" do
    assert calculate("40 5 /") == 8
  end

  test "given two expressions with two addition operators, the sum of three numbers is returned" do
    assert calculate("3 2 1 + +") == 6
  end

  test "handles multiple operators in correct order" do
    assert calculate("3 5 8 * 7 + *") == 141
  end
end
