defmodule WordsToHex do
  @moduledoc false

  @doc """
  Gary likes pictures but he also likes words and reading. He
  has had a desire for a long time to see what words and books
  would look like if they could be seen as images.

  For this task you are required to take a continuous string
  that can consist of any combination of words or characters
  and then convert the words that make up this string into
  hexadecimal values that could then be read as colour values.

  A word is defined as a sequence of ASCII characters between
  two white space characters or the first or last word of a
  sequence of words.

  Each word will represent a hexadecimal value by taking the
  first three letters of each word and find the ASCII character
  code for each character. This will then give you one
  hexadecimal value that represents the colours red, green
  or blue. You will then combine these values into one
  readable RGB hexadecimal value, ie, #ffffff.

  If your word consists of less than 3 letters, you should use
  the hexidecimal value '00', ie "It" would return a value
  #497400.

  Your answer should be an array of hexadecimal values that
  correspond to each word that made up your original string.

  ## Example:

  iex> words_to_hex("Hello, my name is Gary and I like cheese.")
  ["#48656C", "#6D7900", "#6E616D", "#697300", "#476172", "#616E64", "#490000", "#6C696B","#636865"]
  """
  def words_to_hex(words) do
    words
    |> String.split(" ", trim: true)
    |> Enum.map(&to_hex/1)
  end

  defp to_hex(str) when byte_size(str) > 3, do: to_hex(String.slice(str, 0..2))
  defp to_hex(str), do: "#" <> String.pad_trailing(Base.encode16(str, case: :upper), 6, "0")
end
