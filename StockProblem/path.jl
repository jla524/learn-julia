# Plot a path of possible stock prices.

using Plots

S = 100.0
T = 1.0
n = 10_000
σ = 0.3
r = 0.08

# Plot a single stock price path
function singlePath()
    h = T / n
    u = exp(r * h + σ * sqrt(h))
    d = exp(r * h - σ * sqrt(h))
    p = (exp(r * h) - d) / (u - d)

    curr = S
    prices = ones(n) * curr

    for i in 2:n
        curr *= rand() < p ? u : d
        prices[i] = curr
    end

    plot(prices, legend=false)
end

singlePath()
xlabel!("Period")
ylabel!("Price")
title!("Stock Price Path")
savefig("output1")

# Create a function which creates a stock price path given initial parameters
function createPath(S::Float64, r::Float64, sigma::Float64,
                    T::Float64, n::Int64)
    h = T / n
    u = exp(r * h + sigma * sqrt(h))
    d = exp(r * h - sigma * sqrt(h))
    p = (exp(r * h) - d) / (u - d)

    curr = S
    prices = ones(n) * curr

    for i in 2:n
        curr *= rand() < p ? u : d
        prices[i] = curr
    end

    plot!(prices, legend=false)
end

# Use createPath to create 10 different stock paths and plot them all on
# the same plot
Threads.@threads for _ in 2:10
    createPath(S, r, σ, T, n)
end

title!("Stock Price Paths")
savefig("output2")