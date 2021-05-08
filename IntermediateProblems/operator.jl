# Define a type StrangMatrix and define a dispatch such that A*x acts like a
# Strang matrix on a vector.

struct Strang end

function mul(A::Strang, x)
    n = length(x)
    p = zeros(n)
    p[1] = -2 * x[1] + x[2]
    p[end] = x[end-1] - 2 * x[end]
    for i in 2:n-1
        p[i] = x[i-1] -2 * x[i] + x[i+1]
    end
    return reshape(p, :, 1)
end

# Overload the * operator
Base.:*(A::Strang, x) = mul(A, x)

A = Strang()
println(A * ones(10))
println(A * [1 2 3 4])
