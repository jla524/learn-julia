# An AR1 timeseries is defined by "x_{t+1} = \alpha x_t + \epsilon_{t+1}"
# where "x_0 = 0" and "t = 0,...,T". The shocks "\epsilon_t" are i.i.d. 
# standard normal. Using "T = 200" and "\alpha = 0, 0.5, 0.9" use Plots.jl to
# plot a timecourse for each of the parameters. 

using Plots

T = 200
alphas = [0, 0.5, 0.9]
label = ["α = 0" "α = 0.5" "α = 0.9"]
X = []

for alpha in alphas
    x = zeros(T)
    for i in 1:T-1
        x[i+1] = alpha * x[i] + randn()
    end
    push!(X, x)
end

# Plot seems very slow for some reason
plot(1:T, X, label=label, lw=1.5)
savefig("output")
