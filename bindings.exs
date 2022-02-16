defmodule Demo do
  defmacro work(time) do
    #quote bind_quoted: [time: time] do
    quoted_code = quote do
      unquote(time)|> IO.inspect
      :timer.sleep 1000
      unquote(time) |> IO.inspect

    end

    #quoted_code |> Macro.to_string |> IO.inspect
    quoted_code
  end
end

defmodule Playground do
  require Demo

  def test! do
    another_var = "test value"
    :os.system_time |> Demo.work
    IO.inspect another_var
  end
end

Playground.test!
