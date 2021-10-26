defmodule Strain do
  @moduledoc false

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([], _fun), do: []
  def keep([head | tail], fun) do
    case fun.(head) do
      true -> [head | keep(tail, fun)]
      _    -> keep(tail, fun)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([], _fun), do: []
  def discard([head | tail], fun) do
    case fun.(head) do
      false -> [head | discard(tail, fun)]
      _     -> discard(tail, fun)
    end
  end
end
