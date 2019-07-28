defmodule BowlingGameTest do
  use ExUnit.Case

  test "can score single open frame" do
    assert BowlingGame.score([3, 6]) == 9
  end

  test "can score multiple open frames" do
    assert BowlingGame.score([3, 6, 4, 2]) == 15
  end

  test "can score single pair" do
    assert BowlingGame.score([4, "/", 2, 7]) == 21
  end
end
