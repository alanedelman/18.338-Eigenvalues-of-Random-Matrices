#=
bellcurve.jl

ALGORITHM 1.1 of Random Eigenvalues by Alan Edelman

EXPERIMENT  : Generate random samples from the normal distribution
PLOT        : Histogram of random samples
THEORY      : The normal distribution curve
=#

#  ------------ #
# PARAMETERS
#  ------------ #
t = 10000      # trials
dx = .2        # binsize

#  ------------ #
# EXPERIMENT
#  ------------ #
v = randn(t);  # randn - Generate a normally-distributed random number with mean 0 and standard deviation 1.

#  ------------ #
# PLOT
#  ------------ #
# Install package with Pkg.add("Plots")
# Pkg.clone("https://github.com/plotly/Plotly.jl")
using Plotly
plotly()

x = -4:dx:4
histogram(v, xlim=(-4,4), nbins=length(x), normed=true )

#  ------------ #
# THEORY
#  ------------ #
plot!(x,exp.(-x.^2/2)/sqrt(2*pi))
