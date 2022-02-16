#mad_printer = fn(initial_string) ->
salt = "random"

mad_printer = fn
  ("") -> IO.puts("__NOVAL__")
  (initial_string) ->
  initial_string <> salt |>
  String.reverse |>
  IO.puts
end

#closure
salt = "NEW VALUE"

#mad_printer.("hello there friend!") #lambda needs dots. even if no argument, need brackets/parentheses
Enum.each ["hello", "there", "", "friend"], mad_printer
