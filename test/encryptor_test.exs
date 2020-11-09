defmodule EncryptorTest do
  use ExUnit.Case

  import Encryptor, only: [rot13: 1]

  @moduletag :capture_log

  doctest Encryptor

  test "test" do
    assert "grfg" == rot13("test")
  end

  test "Test" do
    assert "Grfg" == rot13("Test")
  end

  test "all lower" do
    assert "nopqrstuvwxyzabcdefghijklm" == rot13("abcdefghijklmnopqrstuvwxyz")
  end
end
