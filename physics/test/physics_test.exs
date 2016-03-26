defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "calcs rounded_to_nearest_tenth" do
    assert 3.2 == Calcs.rounded_to_nearest_tenth(3.1415)
  end
  
  test "calcs convert_to_km" do
    assert 1 == Calcs.convert_to_km(1000)
  end
  
  test "escape_velocity of earth" do
    assert 11.2 == Physics.Rocketry.escape_velocity(:earth)
  end  
  
  test "escape_velocity of jupiter" do
    assert 358.3 == Physics.Rocketry.escape_velocity(%{mass: 4.18e27, radius: 4.34407e6})
  end 
end
