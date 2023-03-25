%======================================================
%              César Herrera Garro
%                   03/15/22
%======================================================
function alphak = computeStepSize(xk, pk, vk, rho, delta, omega, problem)
i = 0;
fk = gradientF(xk, problem);
while pk' * gradientF(xk + rho.*(omega^i).*pk, problem) + ...
        (1/2)*vk*rho*(omega^i)*norm(pk)*norm(pk) > delta.*pk'*fk
    i=i+1;
end
if i==0 
    i = 1;
end 
alphak = rho*(omega^i);
end