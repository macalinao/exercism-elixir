defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    Enum.flat_map(Dict.to_list(input), fn({ letter, strs }) ->
      Enum.map(strs, fn(str) ->
        { String.downcase(str), letter }
      end)
    end) |> Enum.into(%{})
  end
end
