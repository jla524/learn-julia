# Plot the roots of Wilkinson's polynomial with perturbation
using Polynomials
using LinearAlgebra
using Plots
using Random

n = 20
r = collect(Int128(1):n) # use Int128 to prevent integer overflow

# Convert root form to coefficient form (compute a_k)
p = fromroots(r)
a = p[0:20]

# Calculate roots of a polynomial by using the companion matrix
function poly_roots(z)
    comp = companion(Polynomial(z))
    eigvals(comp)
end

# Plot roots without perturbation
plt = scatter(1:20, zeros(20), color=:green, markersize=5, legend=false)

# Compute perturbed coefficients
rts = Vector{Complex{Float64}}[]
for i in 1:100
    pert_coeff = a .* (1 .+ 1e-10 * rand(n+1))
    push!(rts, poly_roots(pert_coeff))
end

# Plot roots with perturbation
for rt in rts
    scatter!(plt, real.(rt), imag.(rt), color=:red, markersize=1)
end

savefig("output")
