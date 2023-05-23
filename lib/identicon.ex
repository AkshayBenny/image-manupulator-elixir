defmodule Identicon do
  def main(input) do
    input
    |> hash_string
    |> get_rgb

  end

  def hash_string(input) do
    :crypto.hash(:md5, input)  |> :binary.bin_to_list
  end

  def get_rgb(input) do
    rgb = Enum.take(input, 3)
    rgb
  end
end
