defmodule FizzBuzz do
  def fizz(num) when rem(num, 3) == 0 and rem(num, 5) == 0 do
    "fizzbuzz"
  end

  def fizz(num) when rem(num, 3) == 0 do
    "fizz"
  end

  def fizz(num) when rem(num, 5) == 0 do
    "buzz"
  end

  def fizz(num) do
    num
  end
end
