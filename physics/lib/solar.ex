defmodule Solar do
    def power(%{classification: :C, scale: scale}), do: power(1, scale)
    def power(%{classification: :M, scale: scale}), do: power(10, scale)
    def power(%{classification: :X, scale: scale}), do: power(1000, scale)
    def power(classification, scale) do
        classification * scale 
    end        
end