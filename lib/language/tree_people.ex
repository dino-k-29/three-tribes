defmodule Language.TreePeople do
  @behaviour Tribe

  @impl Tribe
  def ordered_words do
    ["tree", "scratch"]
  end
  
  def scratch do
    [%Rock{}]
  end

  def tree do
    [scratch(), scratch(), scratch(), scratch(), scratch(), scratch(), scratch()]
    |> List.flatten()
  end
end
