defmodule ChuckNorris.MixProject do
  use Mix.Project

  def project do
    [
      app: :chuck_norris,
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Api to consume `https://api.chucknorris.io/`",
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ChuckNorris, []},
      env: [ interval: :timer.minutes(5)]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Ruben Amortegui"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ramortegui/chuck_norris_api"}
    ]
  end
end
