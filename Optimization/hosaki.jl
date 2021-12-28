# Use Optim.jl to optimize Hosaki's Function.
# Use the initial condition [2.0, 2.0].

using Optim

f(x) = (1 - 8x[1] + 7x[2]^2 - 7/3x[1]^3 + x[1]^4 / 4) * x[2] ^ 2 * exp(-x[2])
println(Optim.optimize(f, [2.0, 2.0]))