# Use Julia's interop capabilities to solve the least squares problem using
# your language of choice and retrieve the answer back to Julia.

n = 6
x = [1.0, 2, 4, 5, 10, 20]
y = [4.0, 6, 12, 15, 34, 68]

m = Ref{Cdouble}(0.1)
b = Ref{Cdouble}(0.2)
r = Ref{Cdouble}(0.3)

ccall((:linreg,"linreg.so"), Int64,
      (Int64, Ptr{Cdouble}, Ptr{Cdouble},
       Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
       n, x, y, m, b, r)

m = getindex(m)
b = getindex(b)
r = getindex(r)

println("m = $m, b = $b, r = $r")
