# Do your implementations *obey* dimensional analysis? Try using the package
# Unitful to build arrays of numbers with units, and see if you can make 
# your LinSpace not give errors.

using Unitful

# Struct and functions are copied from linspace.jl
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

obj = LinSpace(1u"kg", 10u"kg", 10)
println(obj)
println(obj[5])
