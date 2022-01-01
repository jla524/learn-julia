# Make a beautiful plot of your regression

using Loess, Plots

xs = 12 .* rand(100)
ys = cos.(xs) .+ 0.5 * rand(100)

model = loess(xs, ys, span=0.5)
us = range(extrema(xs)...; step=0.1)
vs = predict(model, us)

scatter(xs, ys, title="Regression Plot", label="data")
plot!(x -> cos(x) + 0.25, 0, 12, label="linear regression")
plot!(us, vs, label="smoothed")

xlabel!("x")
ylabel!("y")
savefig("output")