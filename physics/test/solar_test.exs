defmodule SolarTest do
  use ExUnit.Case
  use Timex
  import Solar.Flare

  setup do
    flares = [
      %Solar.Flare{classification: :X, scale: 99,   date: Date.from({1859, 8, 29})},
      %Solar.Flare{classification: :M, scale: 5.8,  date: Date.from({2015, 1, 12})},
      %Solar.Flare{classification: :M, scale: 1.2,  date: Date.from({2015, 2, 9})},
      %Solar.Flare{classification: :C, scale: 3.2,  date: Date.from({2015, 4, 18})},
      %Solar.Flare{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %Solar.Flare{classification: :C, scale: 2.5,  date: Date.from({2015, 7, 4})},
      %Solar.Flare{classification: :X, scale: 72,   date: Date.from({2012, 7, 23})},
      %Solar.Flare{classification: :X, scale: 45,   date: Date.from({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end
  
  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end
  
  test "power :X", %{data: flares} do
    assert 99000 == power(List.first(flares))
  end 
  
  test "power :M" do
    assert 990 == power(%{classification: :M, scale: 99})
  end 
  
  test "power :C", %{data: flares} do 
    assert 99 == power(%{classification: :C, scale: 99})
  end

  test "total_flare_power", %{data: flares} do
    assert 216911.7 == total_flare_power(flares)
  end 

  test "flare_power_sum", %{data: flares} do
    assert 216911.7 == flare_power_sum(flares)
  end 

  test "flare_power_comprehension", %{data: flares} do 
    assert flare_power_sum(flares) == total_flare_power(flares)
  end

  test "flare_list", %{data: flares} do 
    result = flare_list(flares)
    assert result == [
      {:flare, :power, 99000, :is_deadly, true},
      {:flare, :power, 58.0, :is_deadly, false},
      {:flare, :power, 12.0, :is_deadly, false},
      {:flare, :power, 3.2, :is_deadly, false},
      {:flare, :power, 836.0, :is_deadly, false},
      {:flare, :power, 2.5, :is_deadly, false},
      {:flare, :power, 72000, :is_deadly, true},
      {:flare, :power, 45000, :is_deadly, true}
    ]
  end
  
  test "A Solar Flare is a Map with a special key" do
    assert %Solar.Flare{}.__struct__ == Solar.Flare
  end 

end