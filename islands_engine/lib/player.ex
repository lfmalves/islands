defmodule IslandsEngine.Player do
  alias IslandsEngine.{Board, Coordinate, IslandSet, Player}

  defstruct name: :none, board: :none, island_set: :none

  def start_link(name \\ :none) do
    {:ok, board} = Board.start_link()
    {:ok, island_set} = IslandSet.start_link()
    Agent.start_link(fn -> %Player{board: board, island_set: island_set, name: name} end)
  end
end
