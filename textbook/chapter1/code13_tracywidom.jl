#=
tracywidom.jl

ALGORITHM 1.3 of Random Eigenvalues by Alan Edelman

EXPERIMENT  :  ~
PLOT        : Tracy widom distribution
THEORY      : Compute tracy-widom distribution
=#

#  ------------ #
# PARAMETERS
#  ------------ #
t0 = 5.0          # right endpoint
tn = -8.0         # left endpoint
dx = 0.005      # discretization

#  ------------ #
# THEORY
#  ------------ #
# Install the differential equations solver package with
# Pkg.add("DifferentialEquations")

using DifferentialEquations

# System of differential equations described in Eq.(1.6)
function tw_diff_eq_system(dy,y,t)
    dy[1] = y[2]
    dy[2] = t*y[1]+2*y[1]^3
    dy[3] = y[4]
    dy[4] = y[1] ^ 2
end

# To use airy opterator
# Pkg.add("SpecialFunctions")
using SpecialFunctions
y0 = [airyai.(t0);airyai.([1,t0]);0;(airyai.(t0))^2]
tspan = (tn,t0)
prob = ODEProblem(tw_diff_eq_system,y0,tspan)
sol = solve(prob,reltol=1e-12,abstol=1e-15)
