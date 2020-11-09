defmodule PersistentBugger do
  @moduledoc false

  @doc """
  Write a function, `persistence`, that takes in a positive parameter `num` and
  returns its multiplicative persistence, which is the number of times you must
  multiply the digits in num until you reach a single digit.

  ## Examples
  iex> persistence(39)
  3
  > because 3*9=27, 2*7=14, 1*4=4 and 4 has only one digit

  iex> persistence(999)
  4
  > because 9*9*9=729, 7*2*9=126, 1*2*6=12, and finally 1*2=2

  iex> persistence(4)
  0
  > because 4 is already a one-digit number
  """
  def persistence(n) do
    persistence(n, 0)
  end

  defp persistence(n, count) when n < 10, do: count
  defp persistence(n, count) do
    n
    |> Integer.digits
    |> Enum.reduce(fn num, acc -> num * acc end)
    |> persistence(count + 1)
  end
end
