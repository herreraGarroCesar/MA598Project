function Fx = functionF(x, problem)
n = length(x);
% Output function
Fx = 0;
switch problem
    case 25
        % f_{n+1}
        fn1 = 0;
        for i = 1:n
            % Adding f_i^2
            Fx = Fx + (x(i) - 1)*(x(i) - 1);
            % Contructing f_{n+1}
            fn1 = fn1 + i*(x(i) - 1);
        end 
        % f_{n+2}
        fn2 = fn1*fn1;
        Fx = Fx + fn1*fn1 + fn2*fn2;
    case 30
        f = zeros(n, 1);
        f(1) = (3 - 2*x(1))*x(1) - 2*x(2) + 1;
        f(n) = (3 - 2*x(n))*x(n) - x(n-1) + 1;
        for i = 2:n-1
            f(i) = (3 - 2*x(i))*x(i) - x(i-1) - 2*x(i+1) + 1;
        end
        for i = 1 : n
            Fx = Fx + f(i)*f(i);
        end
    case 32
        s = 0;
        for i = 1:n 
            s = s + x(i);
        end 
        for i = 1:n
            Fx = Fx + (x(i) - (2/n)*s - 1)*(x(i) - (2/n)*s - 1);
        end
end
end 
