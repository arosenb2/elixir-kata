defmodule CamelCase do
  @moduledoc false

  @doc """
  Complete the method/function so that it converts dash/underscore delimited words into camel casing.
  The first word within the output should be capitalized only if the original word was capitalized
  (known as Upper Camel Case, also often referred to as Pascal case).

  ## Examples

    iex> to_camel_case("the-stealth-warrior")
    "theStealthWarrior"

    iex> to_camel_case("The_Stealth_Warrior")
    "TheStealthWarrior"
  """
  def to_camel_case(str) do
    [first | rest] = String.split(str, ~r/-|_/, trim: true)
    first <> Enum.map_join(rest, &String.capitalize/1)
  end
end
