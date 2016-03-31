defmodule Solar.Flare do

  defstruct [
    classification: :M,
    scale: 0,
    power: 0,
    is_deadly: false,
    date: nil
  ]
  
  def load(flares) do 
    for flare <- flares, do: flare |> calculate_power |> calculate_deadliness
  end 

  def power(%{classification: :C, scale: scale}), do: power(1, scale)
  def power(%{classification: :M, scale: scale}), do: power(10, scale)
  def power(%{classification: :X, scale: scale}), do: power(1000, scale)
  def power(classification, scale) do
      classification * scale 
  end   
  
  def calculate_power(flare) do
    factor = case flare.classification do
      :M ->  10
      :X -> 1000
      :C -> 1
    end
    %{flare | power: flare.scale * factor}
  end     
  
  def calculate_deadliness(flare) do
    %{flare | is_deadly: flare.power > 1000}
  end
  
  def total_flare_power(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.sum
  end 
  
  def flare_power_sum(flares), do: flare_power_sum(flares, 0)
  def flare_power_sum([], total), do: total
  def flare_power_sum([head | tail], total), do: flare_power_sum(tail, power(head) + total)
  
  def flare_power_comprehension(flares) do
    (for flare <- flares, do: power(flare)) |> Enum.sum
  end
  
  def is_deadly(flare) do 
    power(flare) > 1000
  end 
  
  def flare_list(flares) do
    Enum.map flares, fn(flare) ->
      p = power(flare)
      {:flare, :power, p, :is_deadly, is_deadly(flare)}
    end
  end 
      
end