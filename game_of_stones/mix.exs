defmodule GameOfStones.MixProject do
  use Mix.Project

  def project do
    [
      app: :game_of_stones,
      version: "0.1.0",
      elixir: "~> 1.13",
      escript: [
        main_module: GameOfStones.Client
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GameOfStones.Application, [] } #callback module
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:colors, "~> 1.1"}, #X.Y.Z
      {:ex_doc, "~> 0.28.0", only: :dev, runtime: false}
      # arrow allows any version within 1
      # X - major version
      # Y - minor version
      # Z - patch version
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
