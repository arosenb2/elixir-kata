defmodule SongDecoderTest do
  @moduledoc false

  use ExUnit.Case

  import SongDecoder, only: [decode_song: 1]

  @moduletag :capture_log

  doctest SongDecoder

  test "WUB should be replaced by 1 space" do
    assert SongDecoder.decode_song("AWUBBWUBC") == "A B C"
  end

  test "Multiples WUB should be replaced by only 1 space" do
    assert SongDecoder.decode_song("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
  end

  test "Heading or trailing spaces should be removed" do
    assert SongDecoder.decode_song("WUBAWUBBWUBCWUB") == "A B C"
  end
end
