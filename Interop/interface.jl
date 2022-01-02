# Choose a script from your own work. Modify it so that way it requires an
# input, and splits out a sensible output. Use Julia's interop functionalities
# to call this script and retrieve the answer.

using PyCall

py"""
import sys
sys.path.insert(0, ".")
"""

fizzbuzz = pyimport("base")["fizz_buzz"]
println(fizzbuzz(100))
