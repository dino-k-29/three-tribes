defmodule Language.Translate do
  @word_delimeter "-"

  def describe_rocks(language, rocks) when is_list(rocks) do
    translate_to_words(language, rocks, language.ordered_words())
    |> Enum.join(@word_delimeter)
  end

  defp translate_to_words(_language, _rocks = [], _words) do
    []
  end

  defp translate_to_words(language, rocks, words) do
    [word | remaining_words] = words

    [repeat_word, remaining_rocks] =
      use_word(language, word, rocks)

    [repeat_word | translate_to_words(language, remaining_rocks, remaining_words)]
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end

  def use_word(language, word, rocks) do
    word_value =
      length(quantify_word(language, String.to_atom(word)))

    if length(rocks) >= word_value do
      repeat_word(word, rocks, word_value)
    else
      [nil, rocks]
    end
  end

  def repeat_word(word, rocks, word_value) do
    word_repeat_count = div(Enum.count(rocks), word_value)
    repeat_word =
      1..word_repeat_count |> Enum.map(fn _ -> word end)

    rocks_counted = word_repeat_count * word_value
    rocks_remaining = length(rocks) - rocks_counted

    [repeat_word, slice_rocks(rocks, rocks_remaining)]
  end

  def slice_rocks(rocks, count) do
    if count == 0 do
      []
    else
      Enum.slice(rocks, 0..(count - 1))
    end
  end

  def quantify_words(language, words) do
    words
    |> as_atoms
    |> Enum.map(&(quantify_word(language, &1)))
    |> List.flatten()
  end

  defp as_atoms(words) do
    words
    |> String.split(@word_delimeter)
    |> Enum.map(&String.to_atom/1)
  end

  defp quantify_word(language, word) do
    apply(language, word, [])
  end
end
