value = %{ language: "Elixir", platform: "Eduonix"}
IO.puts value[:platform]
IO.puts value.language
new_value = %{value | language: Erlang}
IO.inspect new_value
