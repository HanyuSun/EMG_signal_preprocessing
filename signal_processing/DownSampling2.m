function [ s ] = DownSampling2( x,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = size(x,2);
M = floor(size(x,1)/n);
S = 0;
for i = 2:N
    for j = 1:M
        for k = 1:n
           S = x(n*(j-1)+k,i)/n+S;
        end
        s(j,i) = S;
        S = 0;
    end
end
for i = 1:M
   s(i,1) = x((i-1)*n+1,1); 
end
end

