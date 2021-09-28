defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers))

  @spec search(tuple, integer, integer, integer) :: {:ok, non_neg_integer} | :not_found
  def search(_numbers, _key, low, high) when high < low, do: :not_found
  def search(numbers, _key, low, _high) when low >= tuple_size(numbers), do: :not_found
  def search(numbers, key, low, high) do
    mid_index = low + div(high - low, 2)
    case elem(numbers, mid_index) do
      ^key -> {:ok, mid_index}
      mid_value when key < mid_value -> search(numbers, key, low, mid_index - 1)
      mid_value when key > mid_value -> search(numbers, key, mid_index + 1, high)
    end
  end
end
