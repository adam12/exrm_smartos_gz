defmodule ReleaseManager.Plugin.SmartOSGZ do
  @name "smartos_gz"
  @shortdoc "Setup LD_LIBRARY_PATH for SmartOS Global Zones"
  @moduledoc """
  Modifies the application binstub provided by ExRM/relx, adding an LD_LIBRARY_PATH export
  to the GNU lib folder that contains the ncurses library needed.
  """

  @preload ~s(export LD_LIBRARY_PATH="/usr/gnu/lib/amd64" ### Added by exrm_smartos_gz)

  use ReleaseManager.Plugin
  alias ReleaseManager.Config

  def after_release(%Config{name: name, version: version} = config) do
    binstub = "rel/#{name}/releases/#{version}/#{name}.sh"

    debug "SmartOSGZ: Inserting '#{@preload}' into #{binstub}"

    contents = binstub
    |> File.read!
    |> String.split("\n")
    |> List.insert_at(1, @preload)
    |> Enum.join("\n")

    File.write!(binstub, contents)

    debug "SmartOSGZ: Done!"
  end

  def before_release(_), do: nil
  def after_package(_), do: nil
  def after_cleanup(_), do: nil
end
