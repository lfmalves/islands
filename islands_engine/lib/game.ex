defmodule IslandsEngine.Game do
  use GenServer

  defstruct player1: :none, player2: :none

  def handle_call(:demo, _from, state) do
    {:reply, state, state}
  end

  def call_demo(game) do
    GenServer.call(game, :demo)
  end
end
