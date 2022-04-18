function k_return = getk(model)
%getk A function that calculates the constant, k. 

E_b = model.beam.E;       
E_p = model.piezo.E;       
t_b = model.beam.t;       
t_p = model.piezo.t;      
d_31 = model.piezo.d31;   
I_b = model.beam.I;       
% Substitue all values into the equation for gamma
% The line below calculates gamma for asymetric loading. Uncomment this
% line to model asymetric piezo loading conditions.
% gamma = 6*E_b*E_p*t_b*t_p*(t_b + t_p)*d_31 / ((E_b^2*t_b^4 + E_p*E_b*(4*t_b^3*t_p + 6*t_b^2*t_p^2 + 4*t_b*t_p^3) + E_p^2*t_p)*t_p);
%gamma = (3*E_p*((t_b/2 + t_p)^2 - (t_b/2)^2)*d_31)/(2*t_p*(E_p*((t_b/2 + t_p)^3 - (t_b/2)^3) + E_b*(t_b/2)^3));
gamma = 3*E_p*((t_b/2 + t_p)^2 - (t_b/2)^2);
gamma = gamma/(2*(E_p*((t_b/2 + t_p)^3 - (t_b/2)^3) + E_b*(t_b/2)^3));
gamma = gamma*d_31/t_p;
% Substitue gamma into the equation for k and return value
k_return = E_b*I_b*gamma;

end