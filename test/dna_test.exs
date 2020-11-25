defmodule DnaTest do
  @moduledoc false

  use ExUnit.Case

  import Dna, only: [dna_strand: 1]

  @moduletag :capture_log

  doctest Dna

  test "Four A" do
    assert dna_strand("AAAA") == "TTTT"
  end

  test "ATTGC" do
    assert dna_strand("ATTGC") == "TAACG"
  end

  test "GTAT" do
    assert dna_strand("GTAT") == "CATA"
  end
end
