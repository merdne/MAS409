function [t,wave] = wave_gen(Hs,T,t_end)
%WAVE GEN generates stochastic waves
% Hs is the significant wave height [m]
% T is the mean period [s]
% t end is the end time [s]
% t is the time [s]
% wave is sea surface elevation [m]
%% Input parameters
w = linspace (0.1, 2.0, 20); % frequency range
delta_w = w(2) − w(1);
%% PM spectrum (freq. domain )
w1 = (2∗pi)/T;
A = 0.11∗(Hsˆ2)∗(w1ˆ4);
B = 0.44∗(w1ˆ4);
S = (A./w.ˆ5). ∗ exp(−(B./w.ˆ4));
%% Wave amplitude (time domain)
sfr = 25 ; % sampling frequency (Hz) (higher freq −> higher resolution)
t = [0: 1/sfr: t_end] ; % time vector
phi_test = rng;
phi = 2∗pi∗(rand(1,length (w)) −0.5); % random phase of ith frequency [rad]
rng(phi_test);
A_wave = sqrt(2∗S.∗delta_w); % amplitude of each sine wave. wave = [] ;
for i = 1:length(t)
wave = [wave sum(A_wave .∗cos(w∗t(i) + phi))]; % [m] sea surface elevation
end
end