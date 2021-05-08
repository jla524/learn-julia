# Using a for loop, write a function my_factorial(n) that computes the nth 
# factorial.

function my_factorial(n)
    ans = 1
    for i = 1:n
        ans *= i
    end
    return ans
end;

print(my_factorial(big(100)))
