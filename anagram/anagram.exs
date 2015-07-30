defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    sorted = normalize base
    Enum.filter candidates, fn(candidate) ->
      String.downcase(candidate) !== String.downcase(base) && normalize(candidate) === sorted
    end
  end

  def normalize(word) do
    word |> String.downcase |> String.to_char_list |> Enum.sort
  end
end
