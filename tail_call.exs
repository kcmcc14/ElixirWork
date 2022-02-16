#defmodule ListUtils do
  #def alt_mult(list), do: do_alt_mult([ 1 | list])

  #defp do_alt_mult( [ current_val | [] ] ), do: current_val

  #defp do_alt_mult([current_val, head | tail]) do
    #do_alt_mult [ current_val * head | tail ]
  #end

  #def mult(list), do: do_mult(1,list)

  #defp do_mult(current_val, []), do: current_val

  #defp do_mult(current_val, [head | tail]) do
    #do_mult(current_val * head, tail)
 # end
#end

#ListUtils.alt_mult([1,2,3,4]) |>
#IO.inspect

defmodule Calc do
  def fact(a) when is_integer(a) and a > 0, do: do_fact(1, a)
  def fact(_) do
    {:error, :invalid_argument}
  end


  defp do_fact(result, 0), do: result
  defp do_fact(result, a) do
    result * a |>
    do_fact(a - 1)
  end
end

Calc.fact(1000) |>
IO.inspect
