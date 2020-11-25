defmodule AthleticAssociation do
  @moduledoc false

  @doc """
  You are the "computer expert" of a local Athletic Association (C.A.A.). Many teams
  of runners come to compete. Each time you get a string of all race results of every
  team who has run. For example here is a string showing the individual results of a
  team of 5 runners:

  `"01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17"`

  Each part of the string is of the form: h|m|s where h, m, s (h for hour, m for minutes,
  s for seconds) are positive or null integer (represented as strings) with one or two
  digits. There are no traps in this format.

  To compare the results of the teams you are asked for giving three statistics;
  *range, average and median*.

  `Range`: difference between the lowest and highest values. In {4, 6, 9, 3, 7} the
  lowest value is 3, and the highest is 9, so the range is 9 − 3 = 6.

  `Mean or Average`: To calculate mean, add together all of the numbers in a set and then
  divide the sum by the total count of numbers.

  `Median`: In statistics, the median is the number separating the higher half of a data
  sample from the lower half. The median of a finite list of numbers can be found by
  arranging all the observations from lowest value to highest value and picking the
  middle one (e.g., the median of {3, 3, 5, 9, 11} is 5) when there is an odd number of
  observations. If there is an even number of observations, then there is no single
  middle value; the median is then defined to be the mean of the two middle values (the
  median of {3, 5, 6, 9} is (5 + 6) / 2 = 5.5).

  Your task is to return a string giving these 3 values. For the example given above,
  the string result will be

  `"Range: 00|47|18 Average: 01|35|15 Median: 01|32|34"`

  of the form:

  `"Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"`

  where hh, mm, ss are integers (represented by strings) with **each 2 digits**.

  Remarks:

  if a result in seconds is ab.xy... it will be given *truncated* as ab.

  if the given string is "" you will return ""
  """
  def stat(""), do: ""
  def stat(string) do
    in_seconds = to_list(string)
    "Range: #{range(in_seconds)} Average: #{average(in_seconds)} Median: #{median(in_seconds)}"
  end

  defp to_list(string) do
    string
    |> String.replace(", ", "|")
    |> String.split("|", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(&to_seconds/1)
  end

  defp to_seconds(stat) do
    {hours, minutes, seconds} = stat
    |> Enum.map(&string_to_seconds/1)
    |> List.to_tuple

    (hours * 3600) + (minutes * 60) + seconds
  end

  defp string_to_seconds(str) do
    str
    |> Integer.parse
    |> Tuple.to_list
    |> Enum.at(0)
  end

  defp format(value) do
    in_seconds = rem(value, 3600)
    "#{fill(div(value, 3600))}|#{fill(div(in_seconds, 60))}|#{fill(rem(in_seconds, 60))}"
  end

  defp fill(value) do
    value
    |> Integer.to_string()
    |> String.pad_leading(2, "0")
  end

  defp range(list) do
    format(Enum.max(list) - Enum.min(list))
  end

  defp average(list) do
    list
    |> sum()
    |> fn s -> s / length(list) end.()
    |> float_to_integer()
    |> format()
  end

  defp median(list) do
    with sorted <- Enum.sort(list) do
      if is_even(list) do
        even_median(sorted)
      else
        odd_median(sorted)
      end
    end
    |> format()
  end

  defp is_even(list), do: Integer.mod(length(list), 2) == 0

  defp even_median(list) do
    Enum.slice(list, floor(length(list) / 2) - 1, 2)
    |> sum()
    |> div(2)
  end

  defp odd_median(list) do
    Enum.at(list, ceil(length(list) / 2) - 1)
  end

  defp sum(list), do: Enum.reduce(list, fn num, acc -> num + acc end)

  defp float_to_integer(float) do
    float
    |> Float.floor()
    |> Float.to_string()
    |> String.split(".", trim: true)
    |> Enum.at(0)
    |> String.to_integer()
  end
end
