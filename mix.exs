defmodule ThreadFirst.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_thread_first,
      version: "0.0.1",
      elixir: "~> 1.3",
      description: description(),
      package: package(),
      # build_embedded: Mix.env == :prod,
      # start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp package do
    [
      maintainers: ["Ian Rumford"],
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/ianrumford/elixir-thread-first"}
    ]
  end

  defp description do
    """
    elixir-thread-first: A thread-first macro for Elixir

    An example of writing an Elixir macro to emulate Clojure's thread_first macro
    """
  end
end
