function outputs = engine_cycles
    
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

    % Diffuser
    n_d = 0.92;
    gamma_d = 1.4;
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
    % Turbineh
    
    n_t_p = 0.92;
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

        %% T and p values
        
        % Diffuser
        outputs.To1 = Ta.*(1+((gamma_d-1)./2).*M.^2);
        if M < 1
            rd = 1;
        else
            rd = 1-0.075.*(M-1).^1.35;
        end
        outputs.po1 = pa.*(1+n_d.*((gamma_d-1)./2).*M.^2).^(gamma_d./(gamma_d-1)).*rd;
        % Fan
        outputs.To2 = outputs.To1.*(1+n_f.*(Pr_f.^((gamma_f-1)./gamma_f)-1));
        outputs.po2 = outputs.po1.*Pr_f;
        % Compressor
        outputs.To3 = outputs.To2.*(1+n_c.*(Pr_c.^((gamma_c-1)./gamma_c)-1));
        outputs.po3 = outputs.po2.*Pr_c;
        % Burner
        outputs.To4 = 1689;
        outputs.po4 = outputs.po3.*Pr_b;
        % Turbine
        outputs.To5_1 = outputs.To4-(cp_c.*(outputs.To3-outputs.To1))./(cp_t.*(1+f-b));
        
        %% Performance

    elseif strcmp(type,'turbojet')
    end
end