# Overload the call on the UnitStepRange to give an interpolated value at 
# intermediate points, i.e. if a=1:2:20, then a(1.5)=2.

# Effectively y = mx + b, where m = step and b = start
(a::StepRange)(i::Float64) = a.step * (i - 1) + a.start

a = 1:2:20
print(a(1.5))
