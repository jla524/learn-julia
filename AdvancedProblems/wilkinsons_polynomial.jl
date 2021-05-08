# Plot the roots of Wilkinson's polynomial with perturbation
# This problem has three parts, which are 
#  1. Convert root form to coefficient form. (Compute a_k)
#  2. Calculate roots of a polynomial by using the companion matrix.
#  3. Plot the roots of polynomials.


# Part 1
using Polynomials


# Adapted from:
# https://github.com/JuliaIntervals/ValidatedNumerics.jl/blob/master/examples/Roots%20of%20Wilkinson%20polynomials.ipynb
function wilkinson_coefficients(n)
    p = fromroots(collect(1:n))  # define a polynomial by its roots
    p[1:n] # the coefficients
end


a = wilkinson_coefficients(20)
println(a)

