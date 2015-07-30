defmodule Teenager do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") -> "Sure."
      String.strip(input) == "" -> "Fine. Be that way!"
      String.upcase(input) == input && String.match?(input, ~r/[\p{L}]+/u) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
