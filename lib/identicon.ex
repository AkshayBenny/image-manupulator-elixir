defmodule Identicon do
  def main(input) do
    input
    |> hash_string
    |> get_rgb
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex_list, color: rgb}) do
    Enum.chunk(hex_list, 3) |> mirror_rows
  end
  def hash_string(input) do
    hex = :crypto.hash(:md5, input)  |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def get_rgb(%Identicon.Image{hex: [r,g,b | _tail]} = image) do

    # %Identicon.Image{hex: hex_list} = image
    # [r, g, b | _tail] = hex_list
    # OR
    # rgb = Enum.take(hex_list, 3)
    %Identicon.Image{image | color: {r, g, b}}
  end

  def mirror_rows(grid) do
    for row <- grid do
      first_half = row
      second_half_reversed = row |> Enum.reverse
      [_head | second_half] = second_half_reversed
      first_half ++ second_half
    end
  end
end
