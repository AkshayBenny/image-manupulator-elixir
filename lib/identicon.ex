defmodule Identicon do
  def main(input) do
    input
    |> hash_string
    |> get_rgb
  end

  def hash_string(input) do
    hex = :crypto.hash(:md5, input)  |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def get_rgb(image) do
    %Identicon.Image{hex: hex_list} = image
    rgb = Enum.take(hex_list, 3)
    # OR
    # [r, g, b | _tail] = hex_list
    rgb
  end
end
