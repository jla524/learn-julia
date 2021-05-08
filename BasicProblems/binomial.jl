# Using only rand(), write a function binomial_rv(n,p) that produces one draw
# of Bin(n, p).

function binomial_rv(n, p)
    rv = 0
    for i=1:n
        rand() <= p && (rv += 1)
    end
    return rv
end

print([binomial_rv(10, 0.5) for i in 1:10])
