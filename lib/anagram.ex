defmodule Anagram do
  @moduledoc false

  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    downcase_base = String.downcase(base)
    sorted_base = sort_and_downcase(base)

    Enum.reject(candidates, &(downcase_base == String.downcase(&1)))
    |> Enum.filter(&(sorted_base == sort_and_downcase(&1)))
  end

  def sort_and_downcase(str) do
    String.downcase(str)
    |> String.codepoints()
    |> Enum.sort()
  end
end
