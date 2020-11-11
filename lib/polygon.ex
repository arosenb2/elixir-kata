defmodule Polygon do
  @moduledoc false

  @doc """
  It should calculate the area of a regular polygon of numberOfSides,
  number-of-sides, or number_of_sides sides inside a circle of radius
  circleRadius, circle-radius, or circle_radius which passes through
  all the vertices of the polygon (such circle is called circumscribed
  circle or circumcircle). The answer should be a number rounded to 3
  decimal places.

  iex> area_of_polygon_inside_circle(3, 3)
  11.691

  iex> area_of_polygon_inside_circle(5.8, 7)
  92.053

  iex> area_of_polygon_inside_circle(4, 5)
  38.042
  """
  def area_of_polygon_inside_circle(circle_radius, num_of_sides) do
    num_of_sides * :math.pow(inradius(circle_radius, num_of_sides), 2) * :math.tan(:math.pi / num_of_sides)
    |> Float.round(3)
  end

  defp inradius(circle_radius, num_of_sides), do: circle_radius * :math.cos(:math.pi / num_of_sides)
end
