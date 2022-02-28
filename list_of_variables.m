clear
close all
clc

%input drum
d = 0.2323; %Drum diameter [m]
my = 0.001; %Viscous friction coefficient [Ns/m]
I_d = 1.0; %Drum inertia [kgm^2]
%Wire has no mass and no diameter

%Sheave input
nsh = 2; %Number of sheaves
%No frition. sheaves are ideal.

%Load case input;
Hs = 1.7; %Significant wave height [m]
Tw = 10; %Wave period [s]
mpl = 12000; %Payload [kg]
h_pl0_1 = 7.5; % Load case 1. Initial height of payload above sea bed [m]
h_pl0_2 = 7.5; % Load case 2. Initial height of payload above sea bed [m]
h_pl0_3 = 5.0; % Load case 3. Initial height of payload above sea bed [m]
h_plfin_1 = 7.5; % Load case 1. Final height of payload above sea bed [m]
h_plfin_2 = 5.0; % Load case 2. Final height of payload above sea bed [m]
h_plfin_3 = 0.0; % Load case 3. Final height of payload above sea bed [m]
T_life = 5000; %Operating time [hrs]
hsb = 350; %[m]

%Positioning accuracy
Pos_tol = 0.04; %Positioning accuracy [m]

%Control
%Noise:
sigma_w = 0.5; %standard deviation of the noise [m/s^2]
Beta = 10000; 

%Payload data
V_PL = 2; %Volume payload [m^3]
A_PL = 1.5; %Area payload [m^2]
C_D = 1.8; %Drag coefficient [-]
%F_D = 1/2*rho*v^2*C_D*A_PL

%Seabed spring-damping
k = 1.8e6; %Spring constant [N/m]
b = 6.5e5; %Damping coeff [Ns/m^1.5]

%% Sea bed function:
% if delta < 0
%     F = 0
% else 
%     F = k*delta+b*deltadot*sqrt(delta)
% end

%Travelling block
m_block = 200+200*nsh; %mass of travelling block
% 
% %Appendix A Wave energy spectra
% omega1 = 2*pi/Tw; %Mean frequency of waves
% A = 0.11*Hs^2*omega1^4;
% B = 0.44*omega1^4;
% % S(omega1) = (A/omega1^5)*exp(-B/omega1^4); % Pierson-Moskowitz (PM)
% % spectrum S(ω) [m^2*s]