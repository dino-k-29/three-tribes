defmodule Language.Translate do
  def from_rocks(language, rocks) when is_list(rocks) do
    word_value = fn language, word ->
      apply(language, word, []) |> Enum.count()
    end

    words_ordered_by_quantity =
      language.__info__(:functions)
      |> Keyword.keys()
      |> Enum.sort(&(word_value.(language, &1) >= word_value.(language, &2)))

    select_words(language, rocks, words_ordered_by_quantity)
    |> Enum.join("-")
  end

  defp select_words(_language, _rocks = [], _words) do
    []
  end

  defp select_words(language, rocks, words) do
    [word | remaining_words] = words

    rock_count = rocks |> Enum.count()
    word_value = language |> to_rocks(word |> to_string) |> Enum.count()

    word_can_be_used = rock_count >= word_value
    word_repeat_count = div(rock_count, word_value)

    repeated_word =
      if word_can_be_used do
        1..word_repeat_count |> Enum.map(fn _ -> word end)
      end

    remaining_rocks =
      if word_can_be_used do
        rocks_used = word_repeat_count * word_value
        rocks_to_keep = length(rocks) - rocks_used
        if rocks_to_keep == 0, do: [], else: Enum.slice(rocks, 0..(rocks_to_keep - 1))
      else
        rocks
      end

    [repeated_word | select_words(language, remaining_rocks, remaining_words)]
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end

  def to_rocks(language, words) do
    words
    |> String.split("-")
    |> Enum.map(&String.to_atom/1)
    |> Enum.map(fn x -> apply(language, x, []) end)
    |> List.flatten()
  end
end
