# Create a type MyRange which stores start, step, and stop. After getting
# this correct, use the Julia array interface in order to define the function
# for the a[i] syntax on your type.

struct MyRange
    start
    step
    stop
end

function Base.getindex(a::MyRange, i)
    # Use i - 1 since index starts at 1
    rv = a.start + (i - 1) * a.step
    rv > a.stop && (error("Index is out of bounds!"))
    return rv
end

arr = MyRange(1, 2, 20)
result = arr[5]
println(result)
