defmodule WaveTest do
  @moduledoc false

  use ExUnit.Case

  import Wave, only: [wave: 1]



  doctest Wave

  defp testing(str, exp) do
    actual = Wave.wave str
    assert actual == exp, """
Given string #{str}
Expected     #{inspect exp, charlists: :as_lists}
Got          #{inspect actual, charlists: :as_lists}
"""
  end

  test "basic tests" do
    testing "a       b    ", ["A       b    ", "a       B    "]
    testing "this is a few words", ["This is a few words", "tHis is a few words", "thIs is a few words", "thiS is a few words", "this Is a few words", "this iS a few words", "this is A few words", "this is a Few words", "this is a fEw words", "this is a feW words", "this is a few Words", "this is a few wOrds", "this is a few woRds", "this is a few worDs", "this is a few wordS"]
    testing "", []
    testing " gap ", [" Gap ", " gAp ", " gaP "]
  end
end
