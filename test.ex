defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n-1)
end


defmodule Recursion do
  def printTimes(msg, n) when n > 0 do
    IO.puts(msg)
    printTimes(msg, n - 1)
  end

  def printTimes(_msg, 0) do
    :ok
  end
end

defmodule FindingMax do
  def max([a]), do: a
  def max([head | tail]), do: reduce(tail, head, &check_big/2)

  def check_big(a,b) when a > b, do: a
  def check_big(a,b) when a <= b, do: b
end

defmodule Paperwork do
  def paperwork(n, m) when n > 0 when m > 0 do
    n * m == pages
    IO.puts("You need #{pages} pages.")
  end

  def paperwork(_, _) do
    IO.puts("You don't need any pages.")
  end
end

Paperwork.paperwork(4,5)

defmodule SquareSum do
  def square_sum(nums) do
    nums |> Enum.each(&(&1 * 2)) |> Enum.reduce(nums)

    # your code here

  end
end
