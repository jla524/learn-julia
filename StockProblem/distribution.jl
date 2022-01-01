# Figure out what distribution the stock prices follow when using the binomial model

using Plots

S = 100.0
T = 1.0
n = 10_000
σ = 0.3
r = 0.08

function get_probilities(n)
    probs = zeros(n + 1)
    h = T / n
    u = exp(r * h + σ * sqrt(h))
    d = exp(r * h - σ * sqrt(h))
    p = (exp(r * h) - d) / (u - d)

    for k in 0:n
        c = binomial(BigInt(n), BigInt(k))
        probs[k+1] = c * (p ^ (n - k)) * ((1 - p) ^ k)
    end

    probs
end

# Draw a 3 period binomial tree
println(get_probilities(3))

function get_prices(u, d, n)
    [u ^ (n - k) * d ^ k * S for k in 0:n]
end

function make_distribution(n)
    h = T / n
    u = exp(r * h + σ * sqrt(h))
    d = exp(r * h - σ * sqrt(h))
    
    prices = get_prices(u, d, n)
    probs = get_probilities(n)
    scatter(prices, probs, legend=false)
    xlabel!("Price")
    ylabel!("Probability")
    title!("Distrbution for Binomial Model with $n periods")
    savefig("output$n")
end

make_distribution(10)
make_distribution(50)
make_distribution(100)