clear all
clc
format long g
%读入信号数据
Y1 = xlsread('12_2.xlsx');
Y2 = xlsread('12_3.xlsx');
Y3 = xlsread('12_4.xlsx');
Y4 = xlsread('15_2.xlsx');
Y5 = xlsread('15_3.xlsx');
Y6 = xlsread('15_4.xlsx');
TS = xlsread('start_times.xlsx');
Fs = 1/0.0009;%采样频率

%去直流，整流，陷波，带通滤波
YN1 = Notchwave(Y1,Fs);
YN2 = Notchwave(Y2,Fs);
YN3 = Notchwave(Y3,Fs);
YN4 = Notchwave(Y4,Fs);
YN5 = Notchwave(Y5,Fs);
YN6 = Notchwave(Y6,Fs);

load BF
for i = 2:size(YN1,2)
    YF1(:,i) = filter(Hbp,YN1(:,i));
end

for i = 2:size(YN2,2)
    YF2(:,i) = filter(Hbp,YN2(:,i));
end

for i = 2:size(YN3,2)
    YF3(:,i) = filter(Hbp,YN3(:,i));
end

for i = 2:size(YN4,2)
    YF4(:,i) = filter(Hbp,YN4(:,i));
end

for i = 2:size(YN5,2)
    YF5(:,i) = filter(Hbp,YN5(:,i));
end

for i = 2:size(YN6,2)
    YF6(:,i) = filter(Hbp,YN6(:,i));
end

YF1(:,1) = YN1(:,1);
YF2(:,1) = YN2(:,1);
YF3(:,1) = YN3(:,1);
YF4(:,1) = YN4(:,1);
YF5(:,1) = YN5(:,1);
YF6(:,1) = YN6(:,1);

% %下采样1
% YD1 = DownSampling2(YF1,10);
% YD2 = DownSampling2(YF2,10);
% YD3 = DownSampling2(YF3,10);
% YD4 = DownSampling2(YF4,10);
% YD5 = DownSampling2(YF5,10);
% YD6 = DownSampling2(YF6,10);
% 
% figure(1)
% subplot(6,1,1)
% plot(YD1(:,1),YD1(:,2));
% subplot(6,1,2)
% plot(YD1(:,1),YD1(:,3));
% subplot(6,1,3)
% plot(YD1(:,1),YD1(:,4));
% subplot(6,1,4)
% plot(YD1(:,1),YD1(:,5));
% subplot(6,1,5)
% plot(YD1(:,1),YD1(:,6));


% %下采样2（以torque时间为基准）
% YY1 = Down_sampling(YF1);
% YY2 = Down_sampling(YF2);
% YY3 = Down_sampling(YF3);
% YY4 = Down_sampling(YF4);
% YY5 = Down_sampling(YF5);
% YY6 = Down_sampling(YF6);

% %转化为绝对时间ms，并加上开始时间
Tms = TS(:,7)+TS(:,6)*1000+TS(:,5)*1000*60+TS(:,4)*1000*3600; %初始时间
TYY1 = round(YF1(:,1)*1000)+Tms(1);
TYY2 = round(YF2(:,1)*1000)+Tms(2);
TYY3 = round(YF3(:,1)*1000)+Tms(3);
TYY4 = round(YF4(:,1)*1000)+Tms(4);
TYY5 = round(YF5(:,1)*1000)+Tms(5);
TYY6 = round(YF6(:,1)*1000)+Tms(6);
% 
T1 = T_transfer(TYY1);%转换为绝对时间
T2 = T_transfer(TYY2);
T3 = T_transfer(TYY3);
T4 = T_transfer(TYY4);
T5 = T_transfer(TYY5);
T6 = T_transfer(TYY6);
% 
YF1(:,1) = T1;
YF2(:,1) = T2;
YF3(:,1) = T3;
YF4(:,1) = T4;
YF5(:,1) = T5;
YF6(:,1) = T6;
% 
% %添加日期20190527
y1 = [(TS(1,1)*1e4+TS(1,2)*1e2+TS(1,3))*ones(size(YF1,1),1),YF1];
y2 = [(TS(2,1)*1e4+TS(2,2)*1e2+TS(2,3))*ones(size(YF2,1),1),YF2];
y3 = [(TS(3,1)*1e4+TS(3,2)*1e2+TS(3,3))*ones(size(YF3,1),1),YF3];
y4 = [(TS(4,1)*1e4+TS(4,2)*1e2+TS(4,3))*ones(size(YF4,1),1),YF4];
y5 = [(TS(5,1)*1e4+TS(5,2)*1e2+TS(5,3))*ones(size(YF5,1),1),YF5];
y6 = [(TS(6,1)*1e4+TS(6,2)*1e2+TS(6,3))*ones(size(YF6,1),1),YF6];

% figure(1)
% subplot(6,1,1)
% plot(y1(:,3));
% subplot(6,1,2)
% plot(y1(:,4));
% subplot(6,1,3)
% plot(y1(:,5));
% subplot(6,1,4)
% plot(y1(:,6));
% subplot(6,1,5)
% plot(y1(:,7));
% subplot(6,1,6)
% plot(y1(:,8));
% 
% figure(2)
% subplot(6,1,1)
% plot(y2(:,3));
% subplot(6,1,2)
% plot(y2(:,4));
% subplot(6,1,3)
% plot(y2(:,5));
% subplot(6,1,4)
% plot(y2(:,6));
% subplot(6,1,5)
% plot(y2(:,7));
% subplot(6,1,6)
% plot(y2(:,8));
% 
% figure(3) 
% subplot(6,1,1)
% plot(y3(:,3));
% subplot(6,1,2)
% plot(y3(:,4));
% subplot(6,2,3)
% plot(y3(:,5));
% subplot(6,1,4)
% plot(y3(:,6));
% subplot(6,1,5)
% plot(y3(:,7));
% subplot(6,1,6)
% plot(y3(:,8));
% 
% figure(4)
% subplot(6,1,1)
% plot(y4(:,3));
% subplot(6,1,2)
% plot(y4(:,4));
% subplot(6,1,3)
% plot(y4(:,5));
% subplot(6,1,4)
% plot(y4(:,6));
% subplot(6,1,5)
% plot(y4(:,7));
% subplot(6,1,6)
% plot(y4(:,8));
% 
% figure(5)
% subplot(6,1,1)
% plot(y5(:,3));
% subplot(6,1,2)
% plot(y5(:,4));
% subplot(6,1,3)
% plot(y5(:,5));
% subplot(6,1,4)
% plot(y5(:,6));
% subplot(6,1,5)
% plot(y5(:,7));
% subplot(6,1,6)
% plot(y5(:,8));
% 
% figure(6)
% subplot(6,1,1)
% plot(y6(:,3));
% subplot(6,1,2)
% plot(y6(:,4));
% subplot(6,1,3)
% plot(y6(:,5));
% subplot(6,1,4)
% plot(y6(:,6));
% subplot(6,1,5)
% plot(y6(:,7));
% subplot(6,1,6)
% plot(y6(:,8));

%写入txt
N1 = size(y1,1);
%  !del EMG_20190527_r100_v12_wx_2.txt
fid=fopen('1.txt','w');
for i=1:N1
   fprintf(fid,'%d%d\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n',y1(i,1),y1(i,2),y1(i,3),y1(i,4),y1(i,5),y1(i,6),y1(i,7),y1(i,8)); 
end
fclose(fid);

N2 = size(y2,1);
%  !del EMG_20190527_r100_v12_wx_3.txt
fid=fopen('2.txt','w');
for i=1:N2
   fprintf(fid,'%d%d\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n',y2(i,1),y2(i,2),y2(i,3),y2(i,4),y2(i,5),y2(i,6),y2(i,7),y2(i,8)); 
end
fclose(fid);

N3 = size(y3,1);
%  !del EMG_20190527_r100_v12_wx_4.txt
fid=fopen('3.txt','w');
for i=1:N3
   fprintf(fid,'%d%d\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n',y3(i,1),y3(i,2),y3(i,3),y3(i,4),y3(i,5),y3(i,6),y3(i,7),y3(i,8)); 
end
fclose(fid);

N4 = size(y4,1);
%  !del EMG_20190527_r100_v15_wx_2.txt
fid=fopen('4.txt','w');
for i=1:N4
   fprintf(fid,'%d%d\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n',y4(i,1),y4(i,2),y4(i,3),y4(i,4),y4(i,5),y4(i,6),y4(i,7),y4(i,8)); 
end
fclose(fid);

N5 = size(y5,1);
%  !del EMG_20190527_r100_v15_wx_3.txt
fid=fopen('5.txt','w');
for i=1:N5
   fprintf(fid,'%d%d\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n',y5(i,1),y5(i,2),y5(i,3),y5(i,4),y5(i,5),y5(i,6),y5(i,7),y5(i,8)); 
end
fclose(fid);

N6 = size(y6,1);
%  !del EMG_20190527_r100_v15_wx_4.txt
fid=fopen('6.txt','w');
for i=1:N6
   fprintf(fid,'%d%d\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n%.13f\r\n',y6(i,1),y6(i,2),y6(i,3),y6(i,4),y6(i,5),y6(i,6),y6(i,7),y6(i,8)); 
end
fclose(fid);

















