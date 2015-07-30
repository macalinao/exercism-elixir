defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    al = length a
    bl = length b

    cond do
      al === bl && a === b ->
        :equal
      al === 0 ->
        :sublist
      bl === 0 ->
        :superlist
      al < bl ->
        if sublist(a, b), do: :sublist, else: :unequal
      al > bl && compare(b, a) === :sublist ->
        :superlist
      true ->
        :unequal
    end
  end

  def sublist(a, b) do
    Enum.find Enum.chunk(b, length(a), 1), false, fn(x) ->
      x === a
    end
  end
end
