defmodule Demo do
  def run(str) do
    len = String.length(str)
    cond do
      len > 0 && len < 5 -> "short"
      len >= 5 && len < 10 -> "medium"
      len > 10 -> "long"
      true -> "an empty string" #fallback clause
    end

    #val = 5
    #if val == 5, do: "positive", else: "negative"
    #unless val == 5 do
     # "value is 5"
    #else
      #"not five"
    #end
  end
end

defmodule Demo2 do
  def run(argv) do
    parsed_args = OptionParser.parse(argv, switches: [debug: :boolean])
    case: Keyword.fetch(elem(parsed_args, 0), :debug ) do
      {:ok, true} -> "debug!"
      {:ok, false} -> "no debug!"
      _ -> "debug option is not set!"# fallback clause
    end
  end
end
#Demo.run("") |> IO.inspect
Demo2.run(System.argv) |> IO.inspect
