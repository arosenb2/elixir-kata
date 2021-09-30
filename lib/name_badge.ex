defmodule NameBadge do
  @moduledoc """
  In this exercise you'll be writing code to print name badges for factory employees.
  Employees have an ID, name, and department name.

  Employee badge labels are formatted as follows:
  `"[id] - [name] - [DEPARTMENT]"`.
  """
  @type optional_string :: String.t() | nil
  @doc """
  iex> NameBadge.print(67, "Katherine Williams", "Strategic Communication")
  "[67] - Katherine Williams - STRATEGIC COMMUNICATION"

  iex> NameBadge.print(nil, "Robert Johnson", "Procurement")
  "Robert Johnson - PROCUREMENT"

  iex> NameBadge.print(204, "Rachel Miller", nil)
  "[204] - Rachel Miller - OWNER"

  iex> NameBadge.print(nil, "Rachel Miller", nil)
  "Rachel Miller - OWNER"
  """
  @spec print(optional_string(), String.t(), optional_string()) :: String.t()
  def print(id, name, nil), do: print(id, name, "OWNER")
  def print(id, name, department) do
    if id == nil do
      [name, String.upcase(department)]
    else
      ["[#{id}]", name, String.upcase(department)]
    end
    |> Enum.join(" - ")
  end
end
