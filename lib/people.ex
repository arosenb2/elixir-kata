defmodule People do
  @moduledoc false

  @doc """
  ## Given
  An array containing hashes of names

  ## Return
  A string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

  ## Examples:
  iex> list([ %{name: "Bart"}, %{name: "Lisa"}, %{name: "Maggie"} ])
  "Bart, Lisa & Maggie"

  iex> list([ %{name: "Bart"}, %{name: "Lisa"} ])
  "Bart & Lisa"

  iex> list([ %{name: "Bart"} ])
  "Bart"

  iex> list([])
  ""
  """
  def list([]), do: ""
  def list([%{name: name}]), do: name
  def list([%{name: n1}, %{name: n2}]), do: "#{n1} & #{n2}"
  def list([%{name: name} | rest]), do: "#{name}, " <> list(rest)
end
