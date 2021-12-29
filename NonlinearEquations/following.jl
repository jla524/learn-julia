# Use NLsolve.jl to solve for the roots of the following equation.

using NLsolve

function f!(F, x)
    F[1] = x[1] + x[2] + x[3]^2 - 12
    F[2] = x[1]^2 - x[2] + x[3] - 2
    F[3] = 2x[1] - x[2]^2 + x[3] - 1
end

initial_x = ones(3)
println(nlsolve(f!, initial_x))
println(nlsolve(f!, initial_x, autodiff=:forward))
