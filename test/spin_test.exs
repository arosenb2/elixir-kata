defmodule SpinTest do
  use ExUnit.Case

  import Spin, only: [spin_words: 1]

  @moduletag :capture_log

  doctest Spin

  test "Have fun!" do
    assert spin_words("Have fun!") == "Have fun!"
  end

  test "Welcome is reversed" do
    assert spin_words("Welcome") == "emocleW"
  end

  test "First word is not reversed" do
    assert spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
  end
end
