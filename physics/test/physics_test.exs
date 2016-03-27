defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "calcs rounded_to_nearest_tenth" do
    assert 3.2 == Calcs.to_nearest_tenth(3.1415)
  end
  
  test "calcs convert_to_km" do
    assert 1 == Calcs.to_km(1000)
  end
  
  test "calcs to_m" do
    assert 1000 == Calcs.to_m(1)
  end
  
  test "calcs squared" do
    assert 4 == (2 |> Calcs.squared)
  end 
  
  test "calcs cubed" do
    assert 8 == (2 |> Calcs.cubed)
  end
  
  test "calcs seconds_to_hours" do
    assert 1 == (3600 |> Calcs.seconds_to_hours)
  end 
  
  test "escape_velocity of earth" do
    assert 11.2 == Physics.Rocketry.escape_velocity(:earth)
  end  
  
  test "escape_velocity of jupiter" do
    assert 358.3 == Physics.Rocketry.escape_velocity(%{mass: 4.18e27, radius: 4.34407e6})
  end 
  
  test "escape_velocity of mars" do
    assert 5.1 == Physics.Rocketry.escape_velocity(:mars)
  end
  
  test "escape_velocity of the moon" do
    assert 2.4 == Physics.Rocketry.escape_velocity(:moon)
  end
  
end
