# Implement your own version of the @evalpoly macro called @myevalpoly

macro myevalpoly(x, a...)
    rv = a[end]
    for i in length(a)-1:-1:1
        rv = rv * x + a[i]
    end
    return rv
end

println(@myevalpoly 7 2 3 4 5)
println(@evalpoly 7 2 3 4 5)
