defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce l, 0, fn _, accum ->
      accum + 1
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce l, [], fn el, accum ->
      [el | accum]
    end
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reverse reduce l, [], fn el, accum ->
      [f.(el) | accum]
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reverse reduce l, [], fn el, accum ->
      if f.(el) do
        [el | accum]
      else
        accum
      end
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce(l, acc, f) do
    [x | tail] = l
    res = f.(x, acc)
    reduce(tail, res, f)
  end


  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, b) do
    reduce reverse(a), b, fn el, accum ->
      [el | accum]
    end
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse reduce ll, [], fn list, acc ->
      append reverse(list), acc
    end
  end
end
