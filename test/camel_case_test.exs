defmodule CamelCaseTest do
  @moduledoc false

  use ExUnit.Case

  import CamelCase, only: [to_camel_case: 1]

  @moduletag :capture_log

  doctest CamelCase

  test "to_camel_case" do
    assert to_camel_case("the-stealth-warrior") == "theStealthWarrior"
    assert to_camel_case("The_Stealth_Warrior") == "TheStealthWarrior"
  end
end
