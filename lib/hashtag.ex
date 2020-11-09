defmodule Hashtag do
  @moduledoc false

  @doc """
  The marketing team is spending way too much time typing in hashtags.
  Let's help them with our own Hashtag Generator!

  Here's the deal:

  - It must start with a hashtag (#).
  - All words must have their first letter capitalized.
  - If the final result is longer than 140 chars it must return false.
  - If the input or the result is an empty string it must return false.

  ## Examples

    iex> Hashtag.generate(" Hello there thanks for trying my Kata")
    "#HelloThereThanksForTryingMyKata"

    iex> Hashtag.generate("    Hello     World   ")
    "#HelloWorld"

    iex> Hashtag.generate("")
    false
  """
  def generate(str) do
    str
    |> String.split(" ", trim: true)
    |> Enum.map_join(&String.capitalize/1)
    |> format_output
  end

  defp format_output(""), do: false
  defp format_output(str) when byte_size(str) >= 140, do: false
  defp format_output(str), do: "#" <> str
end
