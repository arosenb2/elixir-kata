defmodule PolygonTest do
  @moduledoc false

  use ExUnit.Case

  import Polygon, only: [area_of_polygon_inside_circle: 2]



  doctest Polygon

  defp testing(r, n, e) do
    a = area_of_polygon_inside_circle(r, n)
    assert a == e, "Testing for area_of_polygon_inside_circle(#{r}, #{n}), expected #{e}, got #{a}"
  end

  test "basic tests" do
    testing(3, 3, 11.691)
    testing(2, 4, 8)
    testing(2.5, 5, 14.86)
  end
end
