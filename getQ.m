function Q_return = getQ(model)
% getQ A function that computes one element of the forcing term, Q(x,t)
betas = model.betas;
k = model.piezo.k;
x_p = model.piezo.x;                      % Assign local variable for clarity
l_p = model.piezo.L;                      % Assign local variable for clarity
Q_return = zeros(model.n, 1);             % Init output array with all zeros

for i = 1:model.n % For each mode, calculate its corresponding Q_i
    Q_return(i) = k.*(d_phi(x_p + l_p, betas(i), model) - d_phi(x_p, betas(i), model));
end

Q_return = inv(model.dynamics.M)*Q_return;


end