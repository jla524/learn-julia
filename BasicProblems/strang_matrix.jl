# Use Julia's array and control flow syntax in order to define the NxN 
# Strang matrix.


N = 10
A = zeros(Int8, N, N)

for i=1:N
    A[i, i] = -2
    (i > 1) && (A[i, i-1] = 1)
    (i > 1) && (A[i-1, i] = 1)
end

show(stdout, "text/plain", A)
