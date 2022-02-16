defmodule Demo do
  def run do
    try do
      exit :very_bad
    catch
      :exit, :very_bad -> "exited due to very bad"
      :exit, _ -> "VERY VERY bad"
    end
  end
end

Demo.run |> IO.inspect
