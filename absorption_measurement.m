% Initialize parameters
% initialize r,A,μa,μs',μt',μeff,b  
% Collect raw data and generate 128 points of raw reflectance data
generate reflectance_experimental (i)   
for i = 1:128
    % Calculate r(i) and R_theoretical(i) using r(i), μa, μs', μt', μeff, and b
    % TODO: Implement the calculation of r(i) and R_theoretical(i)
end

% Fit R_theoretical(i) to R_experimental(i) using MDE (1) to update μa and μs'
for i = 1:128
    % TODO: Implement optimization to fit R_theoretical(i) to R_experimental(i)
    % using optimset and fmincon with predefined bounds to update μa and μs'
end

% Update μt', μeff, and b using the updated μa and μs'
for i = 1:128
    % TODO: Implement updating of μt', μeff, and b using the updated μa and μs'
end

% Calculate μa for each LED using the fzero function
for i = 1:128
    % TODO: Implement the calculation of μa for each eLED using the fzero function
end

% Modified Diffusion Equation (MDE)
function R_theoretical = modified_diffusion_equation(r, μa, μs_prime, μt_prime, μeff, b)
    % Calculate μt' and μeff using μa and μs'
    μt' = μa + μs';
    μeff = sqrt(3 * μa * (μa + μs'));
    
    % Constants for the MDE equation
    m = 2;
    C1 = b / (4 * pi) * (4/3 * A + 1) * (μeff + 1 / (b * r));
    C2 = exp(-μeff * b);
    
    % Modified Diffusion Equation (MDE)
    R_theoretical = 1 / (4 * pi * μt') * (4/3 * A + 1) * (μeff + 1 / (b * r)) * (exp(-μeff * b)) / r^2;
end
