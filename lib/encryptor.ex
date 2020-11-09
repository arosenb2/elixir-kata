defmodule Encryptor do
  @moduledoc false

  @doc """
  ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after
  it in the alphabet. ROT13 is an example of the Caesar cipher.

  Create a function that takes a string and returns the string ciphered with Rot13. If there are
  numbers or special characters included in the string, they should be returned as they are. Only
  letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".
  """
  def rot13(string) do
    string
    |> String.replace(~r/[A-Za-z]+/, &parse/1)
    |> to_string
  end

  def parse(str) do
    str
    |> to_charlist
    |> Enum.map(&compute/1)
  end

  defp compute(num) when num in ?n..?z or num in ?N..?Z, do: num - 13
  defp compute(num), do: num + 13
end
