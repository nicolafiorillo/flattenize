# Flattenize

Module to flattenize an array of arrays (item type agnostic).

## Examples
```Elixir
iex> Flattenize.flattenize([1, [2, [3, 4], 5], 6])
[1, 2, 3, 4, 5, 6]

iex> Flattenize.flattenize([[1, 2, [3]], 4])
[1, 2, 3, 4]

iex> Flattenize.flattenize([[1, 2], [3, 4], [5, 6], [[7], [8], [9]]])
[1, 2, 3, 4, 5, 6, 7, 8, 9]

iex> Flattenize.flattenize([[], [], [], [[], [], []]])
[]
```

## Run tests using docker image

```Bash
docker build -t flattenize .`
```

## Remove built docker image

```Bash
docker rmi flattenize`
```
