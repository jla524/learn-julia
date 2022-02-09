# For the the example presented here, we will use a subset of Word Embedding,
# trained using Word2Vec.jl. These are 100 dimentional vectors, which encode
# syntactic and semantic information about words.

using JSON, Embeddings, Distances, Clustering, LinearAlgebra

words = JSON.parsefile("../data/words.json")
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
    println("-" ^ 32)
    println("Exemplar: ", all_words[examplar])
    member_indices = findall(assignments(aprop) .== i)
    println(join(getindex.([all_words], member_indices), ", "))
end
