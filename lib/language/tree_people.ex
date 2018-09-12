defmodule Language.TreePeople do
  def scratch do
    [%Rock{}]
  end

  def tree do
    [scratch(), scratch(), scratch(), scratch(), scratch(), scratch(), scratch()]
    |> List.flatten()
  end
end
