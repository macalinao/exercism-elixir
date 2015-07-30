defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map dna, fn(c) ->
      cond do
        c == ?A -> ?U
        c == ?C -> ?G
        c == ?T -> ?A
        c == ?G -> ?C
        true -> ?X
      end
    end
  end
end
