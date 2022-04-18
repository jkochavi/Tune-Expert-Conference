function phi_bar_out = phi_bar(model)
% phi_bar This function computes some static elements of the dynamical "B"
% matrix in the state space based on the geometry of the piezos and their
% location along the beam.

% Define the edge of the piezos closest to the fixed end of the beam
x1 = model.piezo.x;
% Define the edge of the piezos farthest from the fixed end of the beam
x2 = model.piezo.x + model.piezo.L;
% Compute for each mode specified
for n = 1:model.n
    phi_bar_out(n) = d_phi(x2,model.betas(n),model) - d_phi(x1,model.betas(n),model);
end
phi_bar_out = [zeros(model.n,1);phi_bar_out'];
end