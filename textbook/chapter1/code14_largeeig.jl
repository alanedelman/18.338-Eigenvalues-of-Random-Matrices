#=
largeeig.jl

ALGORITHM 1.4 of Random Eigenvalues by Alan Edelman

EXPERIMENT  : Largest eigenvalue of random Hermitian matrices
PLOT        : Histogram of the normalized eigenvalues
THEORY      : Tracy-widom as n-> infinity
=#

#  ------------ #
# PARAMETERS
#  ------------ #
n = 100         # matrix size
t = 5000        # trials
v = Float64[]   # eigenvalue samples
dx = .2         # binsize

#  ------------ #
# EXPERIMENT
#  ------------ #
for i=1:t
    A = randn(n,n)+im*randn(n,n)           # n by n matrix of random Gaussians
    S = (A+A')/2                           # symmetrize matrix
    v = append!(v, maximum(eigvals(S)))    # eigenvalues
end
v = n^(1/6)*(v-2*√n) # normalize eigenvalues

#  ------------ #
# PLOT
#  ------------ #
# Install package with Pkg.add("Plots")
# Pkg.clone("https://github.com/plotly/Plotly.jl")
using Plotly
plotly()

x = -5:dx:2
histogram(v, xlim=(-5,2), nbins=length(x), normed=true )

#  ------------ #
# THEORY
#  ------------ #
# Plot tracy widom
