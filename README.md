# Liquid-Crystal-Energy-Stable

Welcome! Thank you for taking interest in this project. These files implement an energy stable numerical method for the Q-tensor model of liquid crystals. Here is a brief rundown of our files:

Main function:
main.m - Main file for input parameters and outputs a visualization of solution along with energy plot
new_scheme3.m - takes in input parameters and computes the numerical solution 
visualize.m - visualizes the result taking the output of new_scheme3.m
energy.m - computes the energy of the solution

Helper functions:
build_mats.m - produces the matrices required for the scheme
disc_laplace_dirichlet.m - produces the 2D Laplcian matrix with homogeneous Dirichlet boundary conditions
disc_laplace_neumann.m - produces the 2D Laplacian matrix with Neumann boundary conditions
frob.m - computes the Froebenius inner productuct of two matrices
initialize_values.m - given the initial data, computes the initial values for the scheme
make_Qtensor.m - given the individual entries for the Q tensor, produces the matrix 
n0.m - initial director data 
P.m - computes P(Q) for a given Q tensor
