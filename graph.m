clc
clear

a = [6 4 ; 1 2 ; -1 1 ;1 0 ; 0 1];
b = [24 ; 6 ; 1 ; 0 ; 0];
c = [5 4];

figure(2);clf
x = 0:0.01:max(b);
m = size(a,1);

for i=1:m
    if a(i,2) == 0
        y = b(i);
        plot(y*ones(size(x)) , x);
        hold on
    else
        y = (b(i) - a(i,1)*x)/a(i,2);
        y = max(0,y);
        plot(x,y);
        hold on;
    end
end

p = [0 ; 0];
index = 0;

for i=1:m-1
    for j = i+1:m
        asub = a([i,j],:)
        bsub = b([i,j])

        if(det(asub) ~= 0)
            x1 = inv(asub)*bsub;
            p = [p,x1]
            index = index+1;
            plot(x1(1),x1(2),'*')
        end
    end
end
pt = p'

n = length(pt);
idx_fes = 0;
nasub = a([1:m-2] , :);
nbsub = b([1:m-2] , :);

for i=1:n
    if(pt(i,:) >= 0)
        pt1 = pt(i,:)'
        if(nasub*pt1 - nbsub <= 0)
            idx_fes = idx_fes + 1;
            feasiblepts(:,idx_fes) = pt1
            plot(pt1(1), pt1(2), 'ro')
            hold on
        end
    end
end
c=[5 4]
z=c*feasiblepts
maxima=max(z)
indexopt=find(z==maxima)
optsol=feasiblepts(:,indexopt)
zopt=maxima
