clear;clc;close all;
    
%% Inputs

Rbar = 8314; % J/kmol-K
Ta = 220; % (K)
pa = 10; % (kPa)
M = 1.5;
Pr_c = 30;
Pr_f = 1.2;
f = 0.018;
f_ab = 0.01;
beta = 2;
b = 0.1;
MW = 28.8;

type = 'turbofan';

%% Engine Characteristics

% Fan
n_f_p = 0.9;
gamma_f = 1.4;
n_f = (Pr_f.^((gamma_f-1)./(gamma_f.*n_f_p))-1)./(Pr_f.^((gamma_f-1)./gamma_f)-1);
% Compressor
n_c_p = 0.9;
gamma_c = 1.38;
cp_c = (Rbar./MW).*(gamma_c./(gamma_c-1));
n_c = (Pr_c.^((gamma_c-1)./(gigamma_c.*n_c_p))-1)./(Pr_c.^((gamma_c-1)./gamma_c)-1);
% Burner
n_b = 0.99;
Pr_b = 0.98;
% Turbine
n_t_p = 0.92;
gamma_t = 1.33;
n_t = 
% Turbine Mixer
% Fan Turbine
n_ft_p = 0.92;
% Afterburner
n_ab = 0.96;
% Core Nozzle
n_n = 0.95;
% Fan Nozzle
n_fn = 0.97;
% Combined Nozzle
n_cn = 0.95;
% Fuel Pump
n_p = 0.35;

%% Outputs

if strcmp(type,'turbofan')

    % Diffuser
    n_d = 0.92;
    gamma_d = 1.4;
    To1 = Ta.*(1+((gamma_d-1)./2).*M.^2);
    if M < 1
        rd = 1;
    else
        rd = 1-0.075.*(M-1).^1.35;
    end
    po1 = pa.*(1+n_d.*((gamma_d-1)./2).*M.^2).^(gamma_d./(gamma_d-1)).*rd;
    % Fan
    To2 = To1.*(1+n_f.*(Pr_f.^((gamma_f-1)./gamma_f)-1));
    po2 = po1.*Pr_f;
    % Compressor
    To3 = To2.*(1+n_c.*(Pr_c.^((gamma_c-1)./gamma_c)-1));
    po3 = po2.*Pr_c;
    % Burner
    To4 = 1689;
    po4 = po3.*Pr_b;
    % Turbine
    To5_1 = To4-(cp_c.*(To3-To1))./(cp_t.*(1+f-b));
    po5_1 = po4.*(1+(1./n_t).*(To5_1./To4-1)).^(gamma_t./(gamma_t-1));

elseif strcmp(type,'turbojet')
end