defmodule FlattenizeTest do
  use ExUnit.Case
  use PropCheck
  doctest Flattenize

  # Some manual cases for smoke testing
  test "manual case 1" do
    assert [1, 2, 3, 4, 5, 6] == Flattenize.flattenize([1, [2, [3, 4], 5], 6])
  end

  test "manual case 2" do
    assert [1, 2, 3, 4] = Flattenize.flattenize([[1, 2, [3]], 4])
  end

  test "manual case 3" do
    [1, 2, 3, 4, 5, 6, 7, 8, 9] = Flattenize.flattenize([[1, 2], [3, 4], [5, 6], [[7], [8], [9]]])
  end

  # border cases for smoke test
  test "border case 1" do
    [] = Flattenize.flattenize([[], [], [], [[], [], []]])
  end

  #
  # Create various array of arrays anc check versus official flatten funtion
  #

  property "1 level deep arrays", [:verbose, {:numtests, 1_000}] do
    forall array <- list(integer())  do
      Flattenize.flattenize(array) == List.flatten(array)
    end
  end

  property "2 level deep arrays", [:verbose, {:numtests, 500}] do
    forall array <- list(list(integer()))  do
      Flattenize.flattenize(array) == List.flatten(array)
    end
  end

  property "3 level deep arrays", [:verbose, {:numtests, 100}] do
    forall array <- list(list(list(integer())))  do
      Flattenize.flattenize(array) == List.flatten(array)
    end
  end

  property "4 level deep arrays", [:verbose, {:numtests, 50}] do
    forall array <- list(list(list(list(integer()))))  do
      Flattenize.flattenize(array) == List.flatten(array)
    end
  end
end
