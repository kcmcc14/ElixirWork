defmodule GameOfStones.Client do

  def main(argv) do
    parse(argv) |> play
  end

  def play(initial_stones_num \\ 30) do
    case GameOfStones.Server.set_stones(initial_stones_num) do
      {player, current_stones, :game_in_progress} ->
        IO.puts "Welcome! It's player #{player} turn. #{current_stones} in the pile." |>
        Colors.green
      {player, current_stones, :game_continue} ->
        IO.puts "continuing the game. It's player #{player} turn. #{current_stones} stones in the pile."
    end

    take()
  end

  defp parse(arguments) do
    {opts, _, _} = OptionParser.parse(arguments, switches: [stones: :integer] )
    opts |> Keyword.get(:stones, 30)
  end

  defp take() do
    case GameOfStones.Server.take( ask_stones() ) do
      {:next_turn, next_player, stones_count} ->
        IO.puts "\nPlayer #{next_player} turns next. Stones: #{stones_count}"
        take()
      {:winner, winner} ->
        IO.puts "\nPlayer #{winner} wins!!!"
      {:error, reason} ->
        IO.puts "\nThere was an error: #{reason}"
        take()
    end
  end

  defp ask_stones do
    IO.gets("\nPlease take from 1 to 3 stones:\n") |>
    String.trim |>
    Integer.parse |>
    stones_to_take()
  end

  defp stones_to_take({count, _}), do: count
  defp stones_to_take(:error), do: 0
end
