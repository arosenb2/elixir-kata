defmodule FindShortTest do
  use ExUnit.Case

  import FindShort, only: [solution: 1]

  @moduletag :capturelog

  doctest FindShort

  test "Sample tests" do
    Enum.each [
      {"bitcoin take over the world maybe who knows perhaps", 3},
      {"turns out random test cases are easier than writing out basic ones", 3},
      {"lets talk about javascript the best language", 3},
      {"i want to travel the world writing code one day", 1},
      {"Lets all go on holiday somewhere very cold", 2}
    ], fn {str,expected} ->
      actual = solution(str)
      assert actual == expected
    end
  end
end
