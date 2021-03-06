defmodule Abento.MixProject do
  use Mix.Project

  def project do
    [
      app: :abento,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :plug,
        :cowboy,
        :libcluster,
        :lbm_kv
      ],
      mod: {Abento, []},
      env: [cowboy_port: 8000]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.0"},
      {:cowboy, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:libcluster, "~> 2.5"},
      {:lbm_kv, git: "https://github.com/sdia/lbm_kv", ref: "bb959858a6"},
      {:distillery, "~> 1.5"}
    ]
  end
end
