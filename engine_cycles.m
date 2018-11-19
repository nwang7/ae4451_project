function engine_cycles

    %% Inputs
    R = 8314; % J/kmol-K
    Ta = 200; % (K)
    Pa = 10; % (kPa)
    M = 1.5;
    Pr_c = 30;
    Pr_f = 1.2;
    f = 0.018;
    f_ab = 0.01;
    beta = 2;
    b = 0.1;s
    
    type = 'turbofan';
    
    %% Engine Characteristics
    
    % Diffuser
    n_d = 0.92;
    gamma_d = 1.4;
    
    % Fan
    n_f_p = 0.9;
    % Compressor
    n_c_p = 0.9;
    % Burner
    n_b = 0.99;
    % Turbine
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
    
        % T and p values
        To1 = Ta.*(1+((gamma_d - 1)/2).*M^2);
        if M < 1
            
        else
            po1 = 
        end
        % Performance
        
    elseif strcmp(type,'turbojet')
    end
end


% Does this work for Sarah