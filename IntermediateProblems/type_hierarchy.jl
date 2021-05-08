# Make a function person_info(x) where, if x is a any type of person, print
# their name. However, if x is a student, print their name and their grade.
# Make a new type which is a graduate student, and have it print their name
# and grade as well. If x is anything else, throw an error. Do not use 
# branching(if), use multiple dispatch to solve the problem!

# Make abstract types
abstract type AbstractPerson end
abstract type AbstractStudent <: AbstractPerson end

# Define subclassing structure
mutable struct Person <: AbstractPerson
    name
end

mutable struct Student <: AbstractStudent
    name
    grade
end

mutable struct GraduateStudent <: AbstractStudent
    name
    grade
end

# Write dispatches on these abstract types
person_info(x::AbstractPerson) = println(x.name)
person_info(x::AbstractStudent) = (println(x.name); println(x.grade))
person_info(x) = error("Unsupported type")

# Test
person_info(Person("Julia"))
person_info(Student("Kevin", 20))
person_info("Doug")
