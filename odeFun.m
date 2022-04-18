function dz = odeFun(t, z, A, Q_eval, Q_time, n)
% odeFun A function to assemble the solution in state-space form to be used
% with ODE45.

Q = interp1(Q_time, Q_eval, t);    % Approximate Q by interpolation at time t
u = [zeros(1,n) Q]';               % Construct u vector
dz = A*z + u;                      % Assemble state-space form

end