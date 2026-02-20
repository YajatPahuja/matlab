clc
clear

a = [2 3 -1 4 ;1 -2 6 -7];
b = [8 ;3];
c = [1 2 3 4];

m = size(a, 1); %number of constraints
n = size(a,2); %no of variables

p = nchoosek(n,m);
q = nchoosek(1:n , m);

sol = [] %all basic solutions
sol1 = [] %all basic feasible solutions

if(n > m)

    for i=1:p
        y = zeros(n,1)
        s = q(i,:)

        t = a(:,s)
        x = inv(t)*b

        y(s) = x;

        sol = [sol y]

        if x > 0
            y(s) = x

            sol1 = [sol1 y]
        end
    end
end

z = c*sol
max(z)
