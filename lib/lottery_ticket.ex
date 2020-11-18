defmodule LotteryTicket do
  @moduledoc false

  @doc """
  Time to win the lottery!

  Given a lottery ticket (ticket), represented by an array of 2-value arrays,
  you must find out if you've won the jackpot.
  Example ticket:

  `[ [ 'ABC', 65 ], [ 'HGR', 74 ], [ 'BYHT', 74 ] ]`

  To do this, you must first count the 'mini-wins' on your ticket. Each sub
  array has both a string and a number within it. If the character code of
  any of the characters in the string matches the number, you get a mini win.
  Note you can only have one mini win per sub array.

  Once you have counted all of your mini wins, compare that number to the
  other input provided (win). If your total is more than or equal to (win),
  return 'Winner!'. Else return 'Loser!'.

  All inputs will be in the correct format. Strings on tickets are not
  always the same length.

  ## Examples:
  iex> bingo([["ABC", 65], ["HGR", 74], ["BYHT", 74]], 2)
  "Loser!"

  iex> bingo([["ABC", 65], ["HGR", 74], ["BYHT", 74]], 1)
  "Winner!"

  iex> bingo([["HGTYRE", 74], ["BE", 66], ["JKTY", 74]], 3)
  "Loser!"
  """
  def bingo(ticket, win) do
    ticket
    |> Enum.reduce(0, fn combo, acc -> acc + (combo |> has_miniwin() |> boolean_to_integer()) end)
    |> show_results(win)
  end

  defp has_miniwin([letters, ordinal]) do
    letters
    |> to_charlist()
    |> Enum.any?(fn letter -> letter == ordinal end)
  end

  def boolean_to_integer(true), do: 1
  def boolean_to_integer(false), do: 0

  defp show_results(actual_wins, target_wins) when actual_wins >= target_wins, do: "Winner!"
  defp show_results(_actual_wins, _target_wins), do: "Loser!"
end
