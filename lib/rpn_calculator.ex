defmodule RPNCalculator do
  @moduledoc false

  def calculate!(stack, operation), do: operation.(stack)

  def calculate(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      _ -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      e -> {:error, e.message}
    end
  end
end
