% Initialize parameters
% initialize r,A,μa,μs',μt',μeff,b
% Collect raw data and generate 128 points of raw reflectance data
generate R_experimental (i)
for i = 1 to 128 do
    calculate r(i), R_theoretical (i) using r(i),μa,μs',μt',μeff,b
end
% Fit R_theoretical (i) to R_experimental (i) using MDE (1) to update μa and μs'
for i = 1 to 128 do
    optimize μa and μs' using optimset and fmincon with predefined bounds
    update μa,μs',μt',μeff,b
end
% Update R_theoretical using the updated μa and μs'
for i = 1 to 128 do
    update μt',μeff,b,and R_theoretical (i)
end
% Calculate μa for each LED using fzero function
