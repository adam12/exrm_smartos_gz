defmodule ExrmSmartosGz.Mixfile do
  use Mix.Project

  def project do
    [app: :exrm_smartos_gz,
     version: "1.0.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  defp deps do
    [{:exrm, "> 0.0.0"}]
  end

  defp description do
    """
    Trying to package an Elixir application for a SmartOS GZ but getting errors about
    ncurses? This will cure what ails you.
    """
  end

  defp package do
    [
      maintainers: ["Adam Daniels"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/adam12/exrm_smartos_gz"}
    ]
  end
end
