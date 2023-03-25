function vk =  computevk(xk, pk, alphak, problem)
vk = -pk' * (gradientF(xk + alphak.*pk, problem) - gradientF(xk, problem)) /...
    (alphak * norm(pk)*norm(pk));
vk = max([0, vk]);
end 