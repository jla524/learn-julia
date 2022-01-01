using DifferentialEquations, Plots
gr()

function lorenz!(du, u, p, t)
    σ, ρ, β = p
    du[1] = σ * (u[2] - u[1])
    du[2] = u[1] * (ρ - u[3]) - u[2]
    du[3] = u[1] * u[2] - β * u[3]
end

u0 = big.([0.1; 0.0; 0.0])
tspan = (0.0, 100.0)
p = (10, 28, 8 / 3)

prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob);

plot(sol)
savefig("output1")
plot(sol, vars=(1, 2, 3))
savefig("output2")
