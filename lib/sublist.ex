defmodule Sublist do
  @moduledoc false

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal # uses pattern matching to find equality
  def compare(a, b) do
    cond do
      is_sublist?(a, b) -> :sublist
      is_sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  def is_sublist?(_a, []), do: false
  # Using :lists.prefix/2 instead of List.starts_with?/2 because starts_with?/2 returns true
  # when the second argument is an empty list. It is interesting that most functions inside List
  # use an erlang function for implementation, but starts_with?/2 doesn't.
  def is_sublist?(a, b), do: :lists.prefix(a, b) || is_sublist?(a, tl(b))
end
