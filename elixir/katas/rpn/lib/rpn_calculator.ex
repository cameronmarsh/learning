defmodule RPNCalculator do
  def calculate(str) do
    Enum.map(String.split(str), &parse/1)
    |> process([])
  end

  defp process([], [head | _tail]) do
    head
  end

  defp process([head | tail], stack) when is_number(head) do
    process(tail, [head | stack])
  end

  defp process([operator | tail], [operand1, operand2 | stack]) do
    result = operate(operator, operand1, operand2)
    process(tail, [result | stack])
  end

  defp operate(operator, operand1, operand2) do
    case operator do
      "+" -> operand2 + operand1
      "-" -> operand2 - operand1
      "*" -> operand2 * operand1
      "/" -> operand2 / operand1
      _ -> :error
    end
  end

  defp parse(expr) do
    case Integer.parse(expr) do
      {num, _} -> num
      :error -> expr
    end
  end

end
