defmodule BasketballWebsite do
  @moduledoc false

  def extract_from_path(data, path) when is_binary(path), do: extract_from_path(data, String.split(path, "."))
  def extract_from_path(data, [head | []]), do: data[head]
  def extract_from_path(data, [head | tail]), do: extract_from_path(data[head], Enum.join(tail, "."))

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
