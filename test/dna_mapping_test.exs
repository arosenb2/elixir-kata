defmodule DnaMappingTest do
  @moduledoc false

  use ExUnit.Case

  doctest DnaMapping

  test "Four A" do
    assert DnaMapping.dna_strand("AAAA") == "TTTT"
  end

  test "ATTGC" do
    assert DnaMapping.dna_strand("ATTGC") == "TAACG"
  end

  test "GTAT" do
    assert DnaMapping.dna_strand("GTAT") == "CATA"
  end
end
