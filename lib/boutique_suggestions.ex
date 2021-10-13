defmodule BoutiqueSuggestions do
  @moduledoc false

  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100.00)
    for top = %{base_color: top_color, price: top_price} <- tops,
        bottom = %{base_color: bottom_color, price: bottom_price} <- bottoms,
        top_color != bottom_color,
        top_price + bottom_price <= maximum_price do
      {top, bottom}
    end
  end
end
