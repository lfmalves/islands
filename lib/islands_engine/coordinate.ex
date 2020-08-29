defmodule IslandsEngine.Coordinate do
  alias __MODULE__

  @enforce_keys [:row, :col]
  @board_range 1..10

  defstruct [:row, :col]

  def new(row, col) when row in @board_range and col in @board_range,
    do: {:ok, %Coordinate{row: row, col: col}}

  def new(_rol, _col), do: {:error, :invalid_coordinates}
end
