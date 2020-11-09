defmodule Spin do
  @moduledoc false

  @doc """
  Write a function that takes in a string of one or more words, and returns the same string,
  but with all five or more letter words reversed (Just like the name of this Kata).
  Strings passed in will consist of only letters and spaces.
  Spaces will be included only when more than one word is present.

  ## Examples:
    iex> spin_words("Hey fellow warriors")
    "Hey wollef sroirraw"

    iex> spin_words("This is a test")
    "This is a test"

    iex> spin_words("This is another test")
    "This is rehtona test"
  """
  def spin_words(message) do
    message
    |> String.split(" ", trim: true)
    |> Enum.map_join(" ", &evaluate_word/1)
  end

  defp evaluate_word(message) when byte_size(message) >= 5, do: String.reverse(message)
  defp evaluate_word(message),                              do: message
end
