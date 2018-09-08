defmodule Language do
  def translate(language, words) when is_binary(words) do
    words
    |> String.split("-")
    |> Enum.map(&String.to_atom/1)
    |> Enum.map(fn x -> apply(language, x, []) end)
    |> List.flatten()
  end
end
