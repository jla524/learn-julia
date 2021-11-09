# The logistic difference equation is defined by the recursion 
# "b_{n+1}=r*b_{n}(1-b_{n})" where "b_n" is the number of bunnies at time n.
# Starting with "b_0 = .25", by around 400 iterations this will reach a steady
# state. This steady state is dependent on r. Write a function which plots the
# steady state attractor.

using Plots

r = 2.9:.001:4
b = ones(length(r)) * .25
X = ones(length(r), 150)

# Run for 400 iterations to ready steady state
for i in 1:400
    @. b = r * b * (1 - b)
end

X[:, 1] = b

# Run another 150 values and state the values
for i in 2:150
    @. X[:, i] = r * X[:, i-1] * (1 - X[:, i-1])
end

# Plot r x-axis vs y_s(r)
plot(collect(r),
     X,
     seriestype=:scatter,
     markersize=.002, 
     legend=false,
     color=:black)

savefig("output")
