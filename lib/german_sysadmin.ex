defmodule Username do
  def sanitize(username = []), do: username
  def sanitize([head | tail]) do
    case head do
      char when char in ?a..?z -> [head | sanitize(tail)]
      ?_ -> [head | sanitize(tail)]
      ?ä -> [?a, ?e] ++ sanitize(tail)
      ?ö -> [?o, ?e] ++ sanitize(tail)
      ?ü -> [?u, ?e] ++ sanitize(tail)
      ?ß -> [?s, ?s] ++ sanitize(tail)
      _ -> sanitize(tail)
    end
  end
end
