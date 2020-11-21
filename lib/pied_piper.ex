defmodule PiedPiper do
  @moduledoc false

  @doc """
  ## Story
  The Pied Piper has been enlisted to play his
  magical tune and coax all the rats out of town.

  But some of the rats are deaf and are going the
  wrong way!

  ## Kata Task
  How many deaf rats are there?

  ## Legend
  P = The Pied Piper
  O~ = Rat going left
  ~O = Rat going right

  ## Example
  iex> count_deaf_rats("~O~O~O~O P")
  0
  iex> count_deaf_rats("P O~ O~ ~O O~")
  1

  iex> count_deaf_rats("~O~O~O~OP~O~OO~")
  2
  """
  def count_deaf_rats(s) do
    s
    |> String.split("P")
    |> fn [left, right] do
      count(left) + count(String.reverse(right))
    end.()
  end

  defp count(str) do
    str
    |> String.replace(" ", "")
    |> String.split("", trim: true)
    |> Enum.take_every(2)
    |> Enum.count(&(&1 == "O"))
  end
end
