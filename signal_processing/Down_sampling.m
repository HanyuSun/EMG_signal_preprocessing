function [ YY ] = Down_sampling( Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%�ҵ�����39�ı�����0.9�ı���,Y��ԭ���ݼ�
a=1;
f(1) = 1;%d��Ӧ��
d(a) = 0;%�²�����X
for i=1:size(Y,1)-1
    b=i*0.9;
    c=a*39;
    if(b>=c)
        d(a)=b; %��ӽ�39n������
        a=a+1;
        f(a)=i; %d��Ӧ�����       
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

