# Tune-Expert-Conferance

This repository contains the source code used to evaluate the analytical model of the cantilever beam system. 
The source code implements Euler-Bernoulli beam theory to evaluate the dynamics of the beam. The structs located in the Beam Profiles
folder were generated using a custom GUI made in MATLAB App Designer, and contain the properties and dimensions of the physical system 
being studied. 

The Simscape Multibody model included in this repository is configured for the 2022a MATLAB and Simulink release, and may not be supported 
with earlier versions of the software. The block diagram is designed a subsystem which can be implemented in other block diagrams as a single 
block within Simulink that represents the plant. 
