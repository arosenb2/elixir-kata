defmodule PiedPiperTest do
  use ExUnit.Case

  import PiedPiper, only: [count_deaf_rats: 1]

  @moduletag :capture_log

  doctest PiedPiper

  test "ex1" do assert count_deaf_rats("~O~O~O~O P") == 0 end
  test "ex2" do assert count_deaf_rats("P O~ O~ ~O O~") == 1 end
  test "ex3" do assert count_deaf_rats("~O~O~O~OP~O~OO~") == 2 end
end
