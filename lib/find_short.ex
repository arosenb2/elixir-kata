defmodule FindShort do
  @moduledoc false

  @doc """
    Simple, given a string of words, return the length of the shortest word(s).

    String will never be empty and you do not need to account for different data types.

    ## Examples
    iex solution("bitcoin take over the world maybe who knows perhaps")
    3
  """
  def solution(s) do
    Regex.split(~r{\s}, s, trim: true)
    |> Enum.map(&byte_size/1)
    |> Enum.min()
  end
end
