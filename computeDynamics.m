function modelDynamics = computeDynamics(model)
% Compute M, C, and K matrices
[modelDynamics.M, modelDynamics.C, modelDynamics.K] = computeMCK(model);           
% Compute the dynamical "A" matrix for state space form
modelDynamics.A = [zeros(model.n)       eye(model.n)                            
     -1*inv(modelDynamics.M)*modelDynamics.K        -1*inv(modelDynamics.M)*modelDynamics.C];
% Compute the dynamical "B" matrix for state space form
modelDynamics.Phi_bar = [zeros(2*model.n, model.n),[zeros(model.n);inv(modelDynamics.M)]]*phi_bar(model);
modelDynamics.B = model.piezo.k*modelDynamics.Phi_bar;
% The lines below compute multiple output matrices for the state space form
% The state space will change depending on the measurement location.
% Therefore, the lines below compute a different "C" matrix for each
% location measured along the beam
if model.n_retrefs
    for z = 1:model.n_retrefs
        for n = 1:model.n
            modelDynamics.C_ss(z,n) = phi(model.retref.x(z),model.betas(n),model);
        end
    end
    modelDynamics.C_ss = [modelDynamics.C_ss, zeros(model.n_retrefs,model.n)];
end
% Compute a vector of the natural frequencies considered in the model
modelDynamics.freqs = unique(round(abs(imag(eig(modelDynamics.A))/(2*pi)),4,'significant'),'rows');
end