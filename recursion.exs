defmodule Calc do
  def fact(0), do: 1
  def fact(a), do: a * fact(a-1)
end

#[head|tail] = list
#head = hd list
#tail = tl list
#[x, y | tail] = list

# PUTS = STRING
# INSPECT = EVERYTHING ELSE


#[1,2,3] -> 1*2*3
defmodule ListUtils do

  def max([current_max | [head | tail]]) when current_max < head do
    max [head | tail]
  end

  def max([current_max | [head | tail]]) when current_max >= head do
    max [current_max | tail]
  end

  def max([current_max]), do: current_max #found max value

  def map([], _fun), do: []

  def map([head | tail], fun) do
    [fun.(head) | map(tail, fun)]
  end


  def mult([]), do: 1

  def mult([head | tail]) do
    head * mult(tail)
  end
end

ListUtils.max([4,6,3,32]) |>
IO.inspect
#ListUtils.map([2,3,4], &(&1*3)) |>
