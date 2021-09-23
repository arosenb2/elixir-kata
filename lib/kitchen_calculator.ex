defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume

  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}

  def from_milliliter({_unit, volume}, to = :cup), do: {to, volume / 240}
  def from_milliliter({_unit, volume}, to = :fluid_ounce), do: {to, volume / 30}
  def from_milliliter({_unit, volume}, to = :teaspoon), do: {to, volume / 5}
  def from_milliliter({_unit, volume}, to = :tablespoon), do: {to, volume / 15}
  def from_milliliter({_unit, volume}, to = :milliliter), do: {to, volume}

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
