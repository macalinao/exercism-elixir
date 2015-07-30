defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    matches = Enum.map(Regex.scan(~r/[\p{L}-\d]+/u, sentence), &(List.first(&1)))
    Enum.reduce matches, %{}, fn el, words ->
      el = String.downcase el
      if Dict.has_key?(words, el) do
        Dict.put(words, el, Dict.get(words, el) + 1)
      else
        Dict.put(words, el, 1)
      end
    end
  end

end
