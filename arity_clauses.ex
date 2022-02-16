defmodule Calc do

  def factorial(0), do: 1

  def factorial(a) when is_integer(a) and a > 0 do
    a * factorial(a - 1)
  end

  def factorial(_) do
    {:error, :invalid_argument}
  end

  def divide(_a, 0) do #_a makes error go away, don't care what value of a is, won't be used in function
    {:error, :zero_division}
  end

  def divide(a, b) do
    a / b
  end

  def add(a) do
    add a, 0
  end

  def add(a, b) do
    a + b
  end

  #multiclosed function
  #def add(a, b \\ 0) do
  #  a + b
  #end
end

#order matters with pattern matching functions

# =logical - =, >, <=
# boolean - and, or, not, !
#arithmetic = +, -, %, join operators <>
