defmodule Phone do
  import Enum

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    stripped = Regex.scan(~r/[0-9]+/, raw) |> map(fn(e) -> at(e, 0) end) |> reduce(fn(e, acc) -> acc <> e end)
    strlen = String.length(stripped)
    cond do
      strlen == 10 ->
        stripped
      strlen == 11 && String.at(stripped, 0) == "1" ->
        String.slice(stripped, 1, 10)
      true ->
        "0000000000"
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    number(raw) |> String.slice(0, 3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    std = number(raw)
    "(" <> String.slice(std, 0, 3) <> ") " <> String.slice(std, 3, 3) <> "-" <> String.slice(std, 6, 4)
  end
end
