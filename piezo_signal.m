function f_a = piezo_signal(t, A, freq, phase)
% piezo_signal Constructs a function to be used with a function handle that
% represents the time function applied to the piezo patch. The amplitude
% parameter, A, is the voltage amplitude of the time function. The
% parameter, freq is given in Hertz. 

f_a = A*sin(2*pi*freq*t + phase*pi/180); % Construct a sine wave given the 
% amplitude, A, the frequency f, and phase.

end