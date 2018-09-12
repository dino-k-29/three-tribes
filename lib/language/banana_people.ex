defmodule Language.BananaPeople do
  def na do
    [%Rock{}]
  end

  def ba do
    [na(), na(), na(), na()]
    |> List.flatten()
  end

  def la do
    [ba(), ba(), ba(), ba()]
    |> List.flatten()
  end
end
