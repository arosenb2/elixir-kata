defmodule ProdFibTest do
  @moduledoc false

  use ExUnit.Case

  import ProdFib, only: [product_fib: 1]

  @moduletag :capture_log

  doctest ProdFib

  def dotest(n, exp) do
      IO.puts("Testing : #{n}")
      act = product_fib(n)
      IO.puts "#{inspect(act)}"
      IO.puts "#{inspect(exp)}"
      assert act == exp
      IO.puts("#")
  end

  test "product_fib" do
      dotest(4895, [55, 89, true])
      dotest(5895, [89, 144, false])
      dotest(74_049_690, [6765, 10_946, true])
  end
end
