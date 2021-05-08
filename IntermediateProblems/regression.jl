# This question has two parts.

# Part 1: Given an Nx3 array of data and a Nx1 array of outcomes, produce the 
# data matrix X which appends a column of 1's to the *back* of the data 
# matrix, and solve for the 4x1 array β via *Xβ = y* using qrfact, or \, or 
# the definition of the OLS estimator. 

X = rand(1000, 3)               # feature matrix
a0 = rand(3)                    # ground truths
y = X * a0 + 0.1 * randn(1000);  # generate response

# I have no idea how to do this...
beta = [X ones(1000)] \ y
println(beta)

# Compare results using llsq
using MultivariateStats
llsq_beta = llsq(X, y)
println(llsq_beta)

# Compute difference (should be very close to 0)
diff = abs.(beta - llsq_beta)
println(diff)


# Part 2: Using your OLS estimator or one of the aforementioned packages, 
# solve for the regression line using the (X, y) data. Plot the (X, y) scatter
# plot using scatter! from Plots.jl. Add the regression line using abline!. 
# Add a title saying "Regression Plot on Fake Data", and label the x and y 
# axis. 

X = rand(100);
y = 2X + 0.1 * randn(100);

# Solve using llsq
b = X \ y;

# Create scatter plot
using Plots
scatter(X, y, title="Regression Plot on Fake Data")

# Plot best fit line
Plots.abline!(b, 0, lw=2)

# Add labels and save
xlabel!("x")
ylabel!("y")
savefig("output")
