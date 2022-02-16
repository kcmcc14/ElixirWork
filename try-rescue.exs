defmodule Demo do
  def run do
    try do
      Keyword.fetch!([a: 6], :a)
    rescue
      #e in KeyError -> e
      KeyError -> IO.puts("key cannot be found...")
      ArgumentError -> "..."
    after # finally, ensure; executes no matter what
      IO.puts "I am executed no matter what!"
    else # executes only if there are no errors
      5 -> "found five!"
      _ -> "not sure!"
    end
  end
end

Demo.run |> IO.inspect
