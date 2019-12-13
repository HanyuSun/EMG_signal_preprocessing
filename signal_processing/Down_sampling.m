function [ YY ] = Down_sampling( Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%找到靠近39的倍数的0.9的倍数,Y是原数据集
a=1;
f(1) = 1;%d对应的
d(a) = 0;%下采样的X
for i=1:size(Y,1)-1
    b=i*0.9;
    c=a*39;
    if(b>=c)
        d(a)=b; %最接近39n的数据
        a=a+1;
        f(a)=i; %d对应的序号       
        e(a)=a*39;
    end
end
d1 = d/1000;
d2 = d1/0.0009;
d2 = d2';
f = f';

for i = 1:size(f,1)
    n =  f(i);
    YY(i,:) = Y(n,:);  
end

end

