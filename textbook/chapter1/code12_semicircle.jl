#=
semicircle.jl

ALGORITHM 1.2 of Random Eigenvalues by Alan Edelman

EXPERIMENT  : Sample random symmetric Gaussian matrices
PLOT        : Histogram of the eigenvalues
THEORY      : Semicircle as n -> infinity
=#

#  ------------ #
# PARAMETERS
#  ------------ #
n = 100         # matrix size
t = 25          # trials
v = Float64[]   # eigenvalue samples
dx = .2         # binsize

#  ------------ #
# EXPERIMENT
#  ------------ #
for i=1:t
    A = randn(n,n)               # n by n matrix of random Gaussians
    S = (A+A')/2               # symmetrize matrix
    v = append!(v, eigvals(S)) # eigenvalues
end
v = v/√(n/2)                   # normalize eigenvalues

#  ------------ #
# PLOT
#  ------------ #
# Install package with Pkg.add("Plots")
# Pkg.clone("https://github.com/plotly/Plotly.jl")
using Plotly
plotly()

x = -2:dx:2
histogram(v, xlim=(-2,2), nbins=length(x), normed=true )

#  ------------ #
# THEORY
#  ------------ #
plot!(x,sqrt.(4 - x.^2)/(2*π))
