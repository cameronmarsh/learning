defmodule BowlingGame do
  def score([]) do
    0
  end

  def score([first_roll | [second_roll | tail]]) do
    score_frame(first_roll, second_roll) + score(tail)
  end

  defp score_frame(pins, second_roll) do
    {second_roll, next_rolls} = List.pop_at(next_rolls, 0)

    case second_roll do
      "/" -> 10 + hd(next_rolls)
      _integer -> pins + second_roll
    end
  end
end
