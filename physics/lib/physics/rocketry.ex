defmodule Physics.Rocketry do

    import Calcs
    import Physics.Laws
    import Planet
    
    def escape_velocity(planet) when is_map(planet) do 
        planet
          |> calculate_escape
          |> to_km
          |> to_nearest_tenth
    end 
   
    def orbital_speed(height), do: orbital_speed(Planet.select[:earth], height)
    def orbital_speed(planet, height) do
        newtons_gravitational_constant * planet.mass / orbital_radius(planet, height)
          |> square_root
    end
    
    def orbital_term(height), do: orbital_term(Planet.select[:earth], height)
    def orbital_term(planet, height) do
        4 * (:math.pi |> squared) * (orbital_radius(planet, height) |> cubed) / (newtons_gravitational_constant * planet.mass)
            |> square_root
            |> seconds_to_hours
    end   
        
    def orbital_acceleration(height), do: orbital_acceleration(Planet.select[:earth],height)
    def orbital_acceleration(planet, height) do
        (orbital_speed(planet, height) |> squared) / orbital_radius(planet, height)
    end 
    
    def orbital_height(planet, seconds) do
      (newtons_gravitational_constant * planet.mass * (seconds |> squared)) / (4 * (:math.pi |> squared))
        |> cube_root
    end 
    
    defp orbital_radius(planet, height) do
      planet.radius + (height |> to_m)
    end
    
    defp calculate_escape(%{mass: mass, radius: radius}) do 
      2 * newtons_gravitational_constant * mass / radius
        |> :math.sqrt
    end

end