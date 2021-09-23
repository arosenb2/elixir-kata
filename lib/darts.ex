defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: pos_integer()
  def score({x, y}) do
    abs_distance = distance({x, y})
    cond do
      abs_distance == 0 -> 10
      between(abs_distance, 0, 1) -> 10
      between(abs_distance, 1, 5) -> 5
      between(abs_distance, 5, 10) -> 1
      true -> 0
    end
  end

  defp distance({x, y}), do: abs(:math.sqrt(:math.pow(x, 2) + :math.pow(y, 2)))
  defp between(abs_distance, min, max) do
    abs_distance <= max and abs_distance > min
  end
end
