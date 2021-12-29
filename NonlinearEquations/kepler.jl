# Use Roots.jl to solve the Kepler equation.

using Roots

f(x) = 10 - x + exp(1) * sin(x)
println(find_zero(f, BigFloat(0)))
