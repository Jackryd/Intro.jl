"""
    OneHotArray{N}

Stores the index and size of an array, with the element at the given index being `true`,
and all other elements being `false`.
"""
struct OneHotArray{N} <: AbstractArray{Bool,N}
    index::NTuple{N,Int}
    size::NTuple{N,Int}
end

Base.size(A::OneHotArray) = A.size

Base.getindex(A::OneHotArray{N}, i::Vararg{Int,N}) where {N} = (i == A.index)

OneHotArray(index::Int, length::Int) = OneHotArray((index,), (length,))

onehot(element, collection::AbstractArray) = OneHotArray(Tuple(findfirst(==(element), collection)), size(collection))
onehot(element, collection) = OneHotArray(findfirst(==(element), collection), length(collection))

unhot(A::OneHotArray, collection) = collection[A.index...]

# pretty printing with ⋅ for false values
function Base.replace_in_print_matrix(x::OneHotArray{N}, i::Integer, j::Integer, s::AbstractString) where N
    x[i,j] ? s : Base.replace_with_centered_mark(s)
end


Base.sum(A::OneHotArray) = 1

using LinearAlgebra

function LinearAlgebra.dot(A::AbstractArray{<:Number,N}, B::OneHotArray{N}) where N
    return A[B.index...]
end

function LinearAlgebra.dot(A::OneHotArray{N}, B::AbstractArray{<:Number,N}) where N
    return dot(B, A)
end
