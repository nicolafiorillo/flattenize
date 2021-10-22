defmodule Flattenize do
  @moduledoc """
  Flattenize method.
  """

  @doc """
  Flatten a array of arrays.

  ## Examples

      iex> Flattenize.flattenize([1, [2, [3, 4], 5], 6])
      [1, 2, 3, 4, 5, 6]

      iex> Flattenize.flattenize([[1, 2, [3]], 4])
      [1, 2, 3, 4]

      iex> Flattenize.flattenize([[1, 2], [3, 4], [5, 6], [[7], [8], [9]]])
      [1, 2, 3, 4, 5, 6, 7, 8, 9]

      iex> Flattenize.flattenize([[], [], [], [[], [], []]])
      []
  """
  def flattenize(items) when is_list(items) do
    Enum.reduce(items, [], fn item, acc -> acc ++ flattenize(item) end)
  end

  def flattenize(item), do: [item]
end
