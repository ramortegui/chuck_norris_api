defmodule ChuckNorris.MixProject do
  use Mix.Project

  def project do
    [
      app: :chuck_norris,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ChuckNorris, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp package do
      files: ["lib", "priv", "mix.exs", "README*",
      "readme*", "LICENSE*", "license*"],
      maintainers: ["Ruben Amortegui"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ramortegui/chuck_norris_api"}
  end
end
