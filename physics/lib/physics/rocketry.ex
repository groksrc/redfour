defmodule Physics.Rocketry do

    def escape_velocity(:earth) do 
        %{mass: 5.972e24, radius: 6.371e6}
          |> escape_velocity    
    end 
        
    def escape_velocity(planet) when is_map(planet) do 
        planet
          |> calculate_escape
          |> Calcs.convert_to_km
          |> Calcs.rounded_to_nearest_tenth
    end 
    
    defp calculate_escape(%{mass: mass, radius: radius}) do 
      newtons_constant = 6.67e-11
      2 * newtons_constant * mass / radius
        |> :math.sqrt
    end

end

defmodule Calcs do
    def rounded_to_nearest_tenth(val) do
      Float.ceil(val, 1)
    end
    
    def convert_to_km(velocity) do
        velocity / 1000
    end 
end

# defmodule Physics.Planet do
    
#     defstruct [
#         name: "Earth",
#         radius: 6.317e6,
#         mass: 5.97e24        
#     ]
    
#     def escape_velocity(planet) do
#         g = 6.67e-11
#         gmr = 2 * g * planet.mass_kg/planet.radius_m
#         vms = :math.sqrt gmr 
#         vkms = vms/1000
#         Float.ceil vkms, 1
#     end
# end

# v = %Physics.Planet{}
#  |> Physics.Planet.escape_velocity
 
# v == 11.2