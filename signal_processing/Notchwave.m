function [z] = Notchwave(x,f)
z(:,1) = x(:,1);
n = size(x,2);
for i = 2:n;
Ts = 1/f;
f0 = 0;
NLen = length(x(:,i));
n = 0:NLen-1;
apha=-2*cos(2*pi*f0*Ts);
beta=0.96;
b=[1 apha 1];
a=[1 apha*beta beta^2];
y=dlsim(b,a,x(:,i));

f0 = 50;
n = 0:NLen-1;
apha=-2*cos(2*pi*f0*Ts);
beta=0.96;
b=[1 apha 1];
a=[1 apha*beta beta^2];
z(:,i)=dlsim(b,a,abs(y));
end

end
