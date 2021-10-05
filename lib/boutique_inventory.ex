defmodule BoutiqueInventory do
  @moduledoc false

  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def increase_quantity(item, count) do
    Map.put(item, :quantity_by_size,
      Enum.map(item[:quantity_by_size], fn {size, quantity} -> {size, quantity + count} end)
      |> Enum.into(%{})
    )
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_size, quantity}, acc -> acc + quantity end)
  end
end
