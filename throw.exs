defmodule Demo do
  def run do
    try do
      throw "val"
    catch
      "val" -> "caught you!"
      _ -> "not sure!"
    end
  end
end

Demo.run |> IO.inspect
