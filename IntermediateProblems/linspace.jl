# A LinSpace object is a lazy representation of N values from start to stop.
# Use the Array interface to implement a lazy version of the LinSpace. 

struct LinSpace
    start
    stop
    N
end

function Base.size(a::LinSpace)
    return (a.N,)
end

function Base.getindex(a::LinSpace, i)
    (a.N == 1 && a.start == a.stop) && return a.start 
    (a.N <= 1 && a.start != a.stop) && (error("endpoints differ"))
    (i <= 0 || i > a.N) && (error("index is out of bound"))
    step = (a.stop - a.start) / (a.N - 1) 
    return a.start + (i - 1) * step
end

# Check LinSpace
obj = LinSpace(1, 2, 50)
println(obj)
println(size(obj))
println(obj[6])

# Compare to range
r = range(1, 2, length=50)
println(size(r))
println(r[6])
