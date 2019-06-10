defmodule Language.HandPeople do
  @behaviour Tribe

  @impl Tribe
  def ordered_words do
    ["thump", "clap"]
  end
  
  def clap do
    [%Rock{}]
  end

  def thump do
    [clap(), clap(), clap(), clap()]
    |> List.flatten()
  end
end
