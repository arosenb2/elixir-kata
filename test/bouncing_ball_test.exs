defmodule BouncingBallTest do
  @moduledoc false

  use ExUnit.Case

  import BouncingBall, only: [drop: 3]



  doctest BouncingBall

  defp testing(numtest, h, bounce, window, answer) do
    IO.puts("Test #{numtest}")
    assert drop(h, bounce, window) == answer
  end

  test "drop" do
    testing(1, 3, 0.66, 1.5, 3)
    testing(2, 30, 0.66, 1.5, 15)
  end
end
