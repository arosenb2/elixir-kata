defmodule PeopleTest do
  @moduledoc false

  use ExUnit.Case

  import People, only: [list: 1]

  @moduletag :capture_log

  doctest People

  test "basic tests" do
    assert list([%{name: "Bart"}, %{name: "Lisa"}, %{name: "Maggie"}, %{name: "Homer"}, %{name: "Marge"}]) == "Bart, Lisa, Maggie, Homer & Marge"
    assert list([%{name: "Bart"}, %{name: "Lisa"}, %{name: "Maggie"}]) == "Bart, Lisa & Maggie"
    assert list([%{name: "Bart"}, %{name: "Lisa"}]) == "Bart & Lisa"
    assert list([%{name: "Bart"}]) == "Bart"
    assert list([]) == ""
  end
end
