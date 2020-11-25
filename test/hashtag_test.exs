defmodule HashtagTest do
  @moduledoc false

  use ExUnit.Case

  import Hashtag, only: [generate: 1]

  @moduletag :capture_log

  doctest Hashtag

  test "with fixed inputs" do
    assert generate("") == false, "Expected an empty string to return false"
    assert " " |> String.duplicate(200) |> generate() == false, "Still an empty string"
    assert generate("Do We have A Hashtag") == "#DoWeHaveAHashtag", "Expected a Hashtag (#) at the beginning."
    assert generate("Codewars") == "#Codewars", "Should handle a single word."
    assert generate("Codewars Is Nice") == "#CodewarsIsNice", "Should remove spaces."
    assert generate("Codewars is nice") == "#CodewarsIsNice", "Should capitalize first letters of words."
    assert generate("code" <> String.duplicate(" ", 140) <> "wars") == "#CodeWars", "#CodeWars"
    assert generate("L" <> String.duplicate("o", 155) <> "ng Cat") == false, "Should return false if the final word is longer than 140 chars."
    assert "a" |> String.duplicate(139) |> generate() == "#A" <> String.duplicate("a", 138), "Should work"
    assert "a" |> String.duplicate(140) |> generate() == false, "Too long"
  end
end
