defmodule Demo do
  defmacro work(argument) do
    #argument
    quote do
      unquote(argument) * 10
    end
  end

  defmacro macro_palindrome?(str, expr) do
    quote do
      if( unquote(str) == String.reverse (unquote(str))) do unquote(expr)
    end
  end

  def palindrome?(str, expr) do
    if str == String.reverse(str), do: expr
  end
end

defmodule Playground do
  require Demo

  def test! do
    #Demo.work({1,2,3,4,5}) |> elem(2) |> IO.inspect
    #Demo.work(2) |> IO.inspect
    Demo.macro_palindrome?("123321", IO.puts("found one!"))
  end


end

Playground.test!
