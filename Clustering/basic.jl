# Use Clustering.jl to cluster using the SepalLength, PetalLength, and
# PetalWidth features via K-means clustering. Make a scatter plot of
# the resulting clusters.

using RDatasets
using Clustering
using Plots

iris = dataset("datasets", "iris")
columns = ["SepalLength", "PetalLength", "PetalWidth"]
features = collect(Matrix(iris[:, columns])')
results = kmeans(features, 3)

scatter(iris.SepalLength, iris.PetalLength, iris.PetalWidth,
        marker_z=results.assignments, color=:lightrainbow, legend=false)
savefig("output")
