defmodule ProdFib do
  @moduledoc false

  @type fib_product() :: [non_neg_integer() | non_neg_integer() | boolean()]

  @doc """
  The Fibonacci numbers are the numbers in the following integer sequence (Fn):

  > 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...

  such as

  > F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.

  Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying

  > F(n) * F(n+1) = prod.

  Your function productFib takes an integer (prod) and returns an array:

  ```
  [F(n), F(n+1), true] or {F(n), F(n+1), 1} or (F(n), F(n+1), True)
  ```

  depending on the language if F(n) * F(n+1) = prod.

  If you don't find two consecutive `F(m) verifying F(m) * F(m+1) = prod` you will return

  ```
  [F(m), F(m+1), False] or {F(n), F(n+1), 0} or (F(n), F(n+1), False)
  ```

  F(m) being the smallest one such as `F(m) * F(m+1) > prod`.

  ## Examples
  iex> product_fib(714)
  [21, 34, true]
  # since F(8) = 21, F(9) = 34 and 714 = 21 * 34

  iex> product_fib(800)
  [34, 55, false]
  # since F(8) = 21, F(9) = 34, F(10) = 55 and 21 * 34 < 800 < 34 * 55

  iex> product_fib(714)
  [21, 34, true]

  iex> product_fib(800)
  [34, 55, false]

  iex> product_fib(714)
  [21, 34, true]

  iex> product_fib(800)
  [34, 55, false]

  iex> product_fib(714)
  [21, 34, true]

  iex> product_fib(800)
  [34, 55, false]
  """
  @spec product_fib(pos_integer) :: fib_product()
  def product_fib(n) do
    calc(1, 0, n)
  end

  def calc(n, previous, target) do
    next = fib(n)
    product = next * previous
    cond do
      product == target -> [previous, next, true]
      product > target -> [previous, next, false]
      true -> calc(n + 1, next, target)
    end
  end

  defp fib(n), do: fib(n, 0, 1)
  defp fib(1, _acc1, acc2), do: acc2
  defp fib(num, acc1, acc2), do: fib(num - 1, acc2, acc1 + acc2)
end
