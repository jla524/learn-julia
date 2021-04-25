# Use random number generation to estimate pi.


function monte_carlo(n)
    land = 0
    for i=1:n
        x, y = rand(Float64, 2)
        x = x * 2 - 1
        y = y * 2 - 1
        land += (x ^ 2 + y ^ 2 <= 1)
    end
    return land * 4.0 / n
end

print(monte_carlo(1e7))
