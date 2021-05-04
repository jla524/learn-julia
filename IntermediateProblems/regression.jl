# Given an Nx3 array of data and a Nx1 array of outcomes, produce the data 
# matrix X which appends a column of 1's to the *back* of the data matrix, and
# solve for the 4x1 array β via βx = b using qrfact, or \, or the definition
# of the OLS estimator. 


X = rand(1000, 3)               # feature matrix
a0 = rand(3)                    # ground truths
y = X * a0 + 0.1 * randn(1000);  # generate response

# I have no idea how to do this...
X1 = [X ones(1000)]
println(X1 \ y)

# Compare results using llsq
using MultivariateStats
println(llsq(X, y))
