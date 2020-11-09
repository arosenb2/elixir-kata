defmodule Dna do
  @moduledoc false

  @doc """
  Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells and carries the "instructions"
  for the development and functioning of living organisms.

  If you want to know more http://en.wikipedia.org/wiki/DNA

  In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G".
  You have function with one side of the DNA (string, except for Haskell); you need to get the other
  complementary side. DNA strand is never empty or there is no DNA at all (again, except for Haskell).

  More similar exercise are found here http://rosalind.info/problems/list-view/ (source)

  ## Examples
  iex> dna_strand("ATTGC")
  "TAACG"

  iex> dna_strand("GTAT")
  "CATA"
  """
  def dna_strand(dna_str) do
    dna_str
    |> String.split("", trim: true)
    |> Enum.map_join(&mapping/1)
  end

  defp mapping("A"), do: "T"
  defp mapping("T"), do: "A"
  defp mapping("C"), do: "G"
  defp mapping("G"), do: "C"
end
