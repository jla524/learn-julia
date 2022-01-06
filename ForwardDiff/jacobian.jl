# Use ForwardDiff.jl to calculate the Jacobian of the given transformation.
# Compare the determinant of the Jacobian against the analytical solution
# r^2sin(θ)

using ForwardDiff, LinearAlgebra

f(r, θ, ϕ) = [r * sin(θ) * cos(ϕ), r * sin(θ) * sin(ϕ), r * cos(θ)]

ρ, θ, ϕ = 2.5, π/4, π/2
coordinates = [ρ, θ, ϕ]

J = ForwardDiff.jacobian(x -> f(x...), coordinates)

det_J = det(J)
det_analytical = ρ^2 * sin(θ)

println(det_J ≈ det_analytical)
