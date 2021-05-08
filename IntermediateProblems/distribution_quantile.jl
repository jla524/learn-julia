# Use multiple dispatch to write a generic algorithm for which calculates the
# qth quantile of any UnivariateDistribution in Distributions.jl, and test 
# your result against the *quantile(d::UnivariateDistribution, q::Number)* 
# function.

using Distributions

function compute_quantile(d::UnivariateDistribution, q::Number)
    prev = mean(d)
    curr = prev + 1 # placeholder
    while abs(curr - prev) >= 1e-5
        curr = prev - (cdf(d, prev) - q) / pdf(d, prev)
        prev = curr
    end
    return curr
end

for dist in [Gamma(5, 1), Normal(0, 1), Beta(2, 4)]
    @show compute_quantile(dist, 0.5)
    @show quantile(dist, 0.5)
    println()
end

