defmodule LotteryTicketTest do
  @moduledoc false

  use ExUnit.Case

  import LotteryTicket, only: [bingo: 2]

  @moduletag :capture_log

  doctest LotteryTicket

  test "Basic Tests" do
    assert bingo([["ABC", 65], ["HGR", 74], ["BYHT", 74]], 2) == "Loser!"
    assert bingo([["ABC", 65], ["HGR", 74], ["BYHT", 74]], 1) == "Winner!"
    assert bingo([["HGTYRE", 74], ["BE", 66], ["JKTY", 74]], 3) == "Loser!"
  end
end
