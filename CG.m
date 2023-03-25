%======================================================
%              César Herrera Garro
%                   03/15/22
% problem: testing function number
% method: 1->FR, 2->PR, 3->PR+, 4->
% n: dimension problem 
% minimum: cost function value at the minimizer
% argmin: minimizer
% norm_gk: eucleadian norm of the gradient at the minimizer 
% itr: number of iterations modn
% number of resets of betak
% time: execution time
%======================================================
function [minimum, argmin, norm_gk, itr, resets, time] = CG(n, method, problem)
% Parameters
rho = 1;
omega = 0.9;
delta = 1e-3;
% Tolerance
epsilon = 1e-6;
% Define x_0
xk = zeros(n, 1);
switch problem 
    case 25
        for i = 1:n
            xk(i) = 1 - (i/n);
        end
    case 30
        xk = -ones(n, 1);
    case 32
        xk = ones(n, 1);
end
% g0, p0, v0
gk = gradientF(xk, problem);
pk = -gk;
vk = 0;
alphak= computeStepSize(xk, pk, vk, rho, delta, omega, problem);
% itr, resets and time
itr = 0;
resets = 0;
t_start = cputime;
while max(abs(gk)) > epsilon
    % Step size
    vk = computevk(xk, pk, alphak, problem);
    alphak = computeStepSize(xk, pk, vk, rho, delta, omega, problem);
    % Update xk, gk, betak
    prev_gk = gk;
    xk = xk + alphak.*pk;
    gk = gradientF(xk, problem);
    switch method
        case 1
            betak = (gk' * gk)/(prev_gk' * prev_gk);
        case 2
            betak = (gk'*(gk-prev_gk))/(prev_gk' * prev_gk);
        case 3
            betak = max([0 (gk'*(gk-prev_gk))/(prev_gk' * prev_gk)]);
        case 4
            betak = (gk' * gk)/(pk'*((gk-prev_gk)));
    end
    
    % Possible reset of  betak
    if itr == n
        itr = 0;
        betak = 0;
        resets = resets + 1;
    end
    % Update direction vector
    pk = -gk + betak.*pk;
    itr = itr + 1;
end 
minimum = functionF(xk, problem);
argmin = xk;
norm_gk = max(abs(gk));
time = cputime - t_start;
end 



    



