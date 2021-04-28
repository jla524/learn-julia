# A LinSpace object is a lazy representation of N values from start to stop.
# Use the Array interface to implement a lazy version of the LinSpace. 


# TODO: Can we add an input check here?
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



obj = LinSpace(1, 16, 3)
println(obj)
println(size(obj))
println(obj[1])

# Compare to range
r = range(1, 16, length=3)
println(size(r))
println(r[1])
