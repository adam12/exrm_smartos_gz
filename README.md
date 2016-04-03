# ExRM Plugin for Smartos global zone Releases

Trying to release an Elixir application for a SmartOS global zone but getting errors about
ncurses? This will cure what ails you.

## Installation

To use with exrm, simply add this project as a dependency:

        def deps do
          [{:exrm_smartos_gz, "~> 0.1.0", only: :dev}]
        end
        
