# Define a type StrangMatrix and define a dispatch such that A*x acts like a
# Strang matrix on a vector.


struct Strang end


function mul(A::Strang, x)
    n = length(x)
    rv = zeros(n)
    # Set rv[i] = x[i-1] - 2 * x[i] + x[i+1]
    for i in 1:n
        i > 1 && (rv[i] += x[i-1])
        rv[i] += -2 * x[i]
        i < n && (rv[i] += x[i+1])
    end
    return reshape(rv, :, 1)
end


# Overload the * operator
Base.:*(A::Strang, x) = mul(A, x)

A = Strang()
println(A * ones(10))
println(A * [1 2 3 4])
