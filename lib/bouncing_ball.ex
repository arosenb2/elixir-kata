defmodule BouncingBall do
  @moduledoc false

  @doc """
  A child is playing with a ball on the nth floor of a tall building. The height of
  this floor, h, is known.

  He drops the ball out of the window. The ball bounces (for example), to two-thirds
  of its height (a bounce of 0.66).

  His mother looks out of a window 1.5 meters from the ground.

  How many times will the mother see the ball pass in front of her window (including
  when it's falling and bouncing?

  ### Three conditions must be met for a valid experiment:
  - Float parameter "h" in meters must be greater than 0
  - Float parameter "bounce" must be greater than 0 and less than 1
  - Float parameter "window" must be less than h.

  If all three conditions above are fulfilled, return a positive integer,
  otherwise return -1.

  ### Note:
  The ball can only be seen if the height of the rebounding ball is strictly greater
  than the window parameter.

  ## Examples:
  iex> drop(3, 0.66, 1.5)
  3

  iex> drop(3, 1, 1.5)
  -1
  """
  def drop(h, _bounce, _window) when h <= 0, do: -1
  def drop(_h, bounce, _window) when bounce <= 0, do: -1
  def drop(_h, bounce, _window) when bounce >= 1, do: -1
  def drop(h, _bounce, window) when window >= h, do: -1
  def drop(h, bounce, window), do: next(h, bounce, window, 1)

  def next(h, _bounce, window, acc) when h <= window, do: acc
  def next(h, bounce, window, acc) when h * bounce > window, do: next(h * bounce, bounce, window, acc + 2)
  def next(h, bounce, window, acc), do: next(h * bounce, bounce, window, acc)
end
