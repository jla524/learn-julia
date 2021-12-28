# Use BlackBoxOptim.jl to find global minima of the Adjiman Function with
# -1 < x1 < 2 and -1 < x2 < 1

using BlackBoxOptim

adjiman(x) = cos(x[1]) * sin(x[2]) - x[1] / (x[2]^2 + 1)
println(bboptimize(adjiman, SearchRange=[(-1.0, 2.0), (-1.0, 1.0)]))