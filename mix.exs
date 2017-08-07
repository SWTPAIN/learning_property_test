defmodule LearningPropertyTest.Mixfile do
  use Mix.Project

  def project do
    [app: :learning_property_test,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:quixir, "~> 0.9", only: :test},
      {:excheck, "~> 0.5", only: :test},
      {:triq, github: "triqng/triq", only: :test}
    ]
  end
end
