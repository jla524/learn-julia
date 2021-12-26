# For the the example presented here, we will use a subhset of Word Embedding, trained using Word2Vec.jl. These are 100 dimentional vectors, which encode syntactic and semantic information about words.
# Use Affinity Propagraion from Clustering.jl, to cluster word2vec word embeddings, according to meaning.
# Done right this will seperate locations from sports
# Done finely and it will seperate ball-sports from other sports, and will seperate locations according to regions, etc
# Affinity propagraion requires a similarity matrix, which you can set as a negated distance matrix.
# For this you'll also want Distances.jl for all your distance metric needs.
# It is traditional with word2vec to use cosine distance.
# You will as also need to set each item's availability. This is the diagonal of the similarity matrix. Decreasing it roughly corresponds to decreasing the amount each node wants to be in a cluster on its own.

using JSON
using Embeddings
using Distances
using Clustering
using LinearAlgebra

words = JSON.parsefile("words.json")
words_by_class = collect(values(words))
all_words = reduce(vcat, words_by_class)
embedding_table = load_embeddings(Word2Vec; keep_words=all_words)
@assert Set(all_words) == Set(embedding_table.vocab)

embeddings = embedding_table.embeddings
all_words = embedding_table.vocab
classes = map(all_words) do word
    findfirst(col -> word ∈ col, words_by_class)
end;

similarity = 1.0 .- pairwise(cosine_dist, embeddings)
similarity[diagind(similarity)] .= 0.01
aprop = affinityprop(similarity)

for (i, examplar) in enumerate(aprop.exemplars)
    println("-"^32)
    println("Exemplar: ", all_words[examplar])
    member_indices = findall(assignments(aprop) .== i)
    println(join(getindex.([all_words], member_indices), ", "))
end