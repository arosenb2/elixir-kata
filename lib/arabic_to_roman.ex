defmodule ArabicToRoman do
  @moduledoc false

  @doc """
  Create a function taking a positive integer as its parameter and returning a string containing the
  Roman Numeral representation of that integer.

  Modern Roman numerals are written by expressing each digit separately starting with the left most digit
  and skipping any digit with a value of zero.
  In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC.
  2008 is written as 2000=MM, 8=VIII; or MMVIII.
  1666 uses each Roman symbol in descending order: MDCLXVI.

  ## Examples:
  iex> solution(1000) # should return "M"
  "M"

  ## Help:

  Symbol    Value
  I          1
  V          5
  X          10
  L          50
  C          100
  D          500
  M          1,000
  Remember that there can't be more than 3 identical symbols in a row.

  More about roman numerals - http://en.wikipedia.org/wiki/Roman_numerals
  """
  @spec solution(pos_integer) :: String.t()
  def solution(number), do: convert(number)

  defp convert(n) when n >= 1000, do: next(n, "M", 1000)
  defp convert(n) when n >= 900,  do: next(n, "CM", 900)
  defp convert(n) when n >= 500,  do: next(n, "D", 500)
  defp convert(n) when n >= 400,  do: next(n, "CD", 400)
  defp convert(n) when n >= 100,  do: next(n, "C", 100)
  defp convert(n) when n >= 90,   do: next(n, "XC", 90)
  defp convert(n) when n >= 50,   do: next(n, "L", 50)
  defp convert(n) when n >= 40,   do: next(n, "XL", 40)
  defp convert(n) when n >= 10,   do: next(n, "X", 10)
  defp convert(9),                do: "IX"
  defp convert(n) when n >= 5,    do: next(n, "V", 5)
  defp convert(4),                do: "IV"
  defp convert(n),                do: String.duplicate("I", n)

  defp next(total, roman, number) do
    String.duplicate(roman, div(total, number)) <> convert(rem(total, number))
  end
end
