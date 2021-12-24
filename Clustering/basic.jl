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
