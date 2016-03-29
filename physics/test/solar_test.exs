defmodule SolarTest do
  use ExUnit.Case
  use Timex

  setup do
    flares = [
      %{classification: :X, scale: 99,   date: Date.from({1859, 8, 29})},
      %{classification: :M, scale: 5.8,  date: Date.from({2015, 1, 12})},
      %{classification: :M, scale: 1.2,  date: Date.from({2015, 2, 9})},
      %{classification: :C, scale: 3.2,  date: Date.from({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %{classification: :C, scale: 2.5,  date: Date.from({2015, 7, 4})},
      %{classification: :X, scale: 72,   date: Date.from({2012, 7, 23})},
      %{classification: :X, scale: 45,   date: Date.from({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end
  
  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end
  
  test "power :X", %{data: flares} do
    assert 99000 == Solar.power(List.first(flares))
  end 
  
  test "power :M" do
    assert 990 == Solar.power(%{classification: :M, scale: 99})
  end 
  
  test "power :C", %{data: flares} do 
    assert 99 == Solar.power(%{classification: :C, scale: 99})
  end

  test "total_flare_power", %{data: flares} do
    assert 216911.7 = Solar.total_flare_power(flares)
  end 

  test "flare_power_sum", %{data: flares} do
    assert 216911.7 = Solar.flare_power_sum(flares)
  end 

end