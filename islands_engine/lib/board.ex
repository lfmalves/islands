defmodule IslandsEngine.Board do
  alias IslandsEngine.Coordinate

  @letters ~W(a b c d e f g h i j)
  @numbers [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  def start_link() do
    Agent.start_link(fn -> initialized_board() end)
  end

  defp keys() do
    for letter <- @letters,
        number <- @numbers do
      String.to_atom("#{letter}#{number}")
    end
  end

  defp initialized_board() do
    Enum.reduce(keys(), %{}, fn key, board ->
      {:ok, coord} = Coordinate.start_link()
      Map.put_new(board, key, coord)
    end)
  end

  def get_coordinate(board, key) when is_atom(key) do
    Agent.get(board, fn board -> board[key] end)
  end

  def guess_coordinate(board, key) do
    get_coordinate(board, key)
    |> Coordinate.guess()
  end

  def coordinate_hit?(board, key) do
    get_coordinate(board, key)
    |> Coordinate.hit?()
  end
end
