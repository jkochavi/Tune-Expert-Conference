function [t, Z] = modalODEcompute(model, t_domain, Q_eval, odeStep)

t = [];
Z = [];
step_ratio = t_domain(end)/length(t_domain); % Time per step ratio
ode45_duration = t_domain(end)/odeStep;      % Run ode45 X times
ICs = zeros(2*model.n,1);                    % Initial conditions of the system
index = 1;
odeset('RelTol', 1e-12, 'AbsTol', 1e-20);
while index < length(t_domain)+1
    end_index = floor(index + ode45_duration/step_ratio);
    if end_index > length(t_domain)
        end_index = length(t_domain);
    end
    ode_t = t_domain(index:end_index) - t_domain(index);
    Q_inc = Q_eval(index:end_index,:);
    [t_inc, Z_inc] = ode45(@(t,Z) odeFun(t,Z,model.dynamics.A,Q_inc,ode_t,model.n), ode_t, ICs);
    t = [t;t_inc+t_domain(index)];
    Z = [Z;Z_inc];
    ICs = Z(end,:);
    index = end_index+1;
end
end