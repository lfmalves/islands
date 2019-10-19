defmodule IslandsEngine.Game do
  use GenServer

  def handle_call(:demo, _from, state) do
    {:reply, state, state}
  end

  def call_demo(game) do
    GenServer.call(game, :demo)
  end

  def cast_demo(pid) do
    GenServer.cast(pid, :demo)
  end
end
