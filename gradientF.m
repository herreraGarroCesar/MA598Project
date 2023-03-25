function gF = gradientF(x, problem)
n = length(x);
gF = zeros(n, 1);
switch problem 
    case 25
        fn1 = 0;
        for i = 1: n
            fn1 = fn1 + i*(x(i) - 1);
        end
        for i = 1:n
            % Problem for large scale 
            gF(i) = 2*(x(i) - 1 + i*fn1 + 2*i*(fn1*fn1*fn1));
        end  
    case 30
        f = zeros(n, 1);
        f(1) = (3 - 2*x(1))*x(1) - 2*x(2) + 1;
        f(n) = (3 - 2*x(n))*x(n) - x(n-1) + 1;
        for i = 2:n-1
            f(i) = (3 - 2*x(i))*x(i) - x(i-1) - 2*x(i+1) + 1;
        end
        gF(1) = 2*((3 - 4*x(1))*f(1) - f(2));
        gF(n) = 2*(-2*f(n-1) + (3 - 4*x(n))*f(n));
        for i = 2:n-1
            gF(i) = 2*(-2*f(i-1) + (3 - 4*x(i))*f(i) - f(i+1));
        end
    case 32 
        f = zeros(n, 1);
        s = 0;
        sumf = 0;
        for i = 1:n 
            s = s + x(i);
        end 
        for i = 1:n
            f(i) = x(i) - (2/n)*s - 1;
            sumf = sumf + f(i);
        end 
        for i = 1:n
            gF(i) = (-4/n)*sumf + 2*f(i); 
        end

end 
end 