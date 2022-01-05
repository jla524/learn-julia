# Use the ForwardDiff.derivative function to take the derivative of
# x^5 + 3x^2. Compare the result to the analytical solution by plotting
# both with Plots.jl, overlaying one on top of the other.

using ForwardDiff, Plots

f(x) = x^5 + 3x^2
g(x) = ForwardDiff.derivative(f, x);
f_prime(x) = 5x^4 + 6x

plot(g, -10, 10)
plot!(f_prime, -10, 10)
savefig("output")
