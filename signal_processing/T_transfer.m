function [ Y ] = T_transfer( T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here TΪ��ת��ʱ�䣬���������ԭʼʱ�䣬YΪת��Ϊʱ���������ʽ��ʱ��
Y = 1e7*floor(T/3600000) + 1e5*floor((T-floor(T/3600000)*3600000)/60000) + 1e3*floor((T-floor(T/3600000)*3600000-floor((T-floor(T/3600000)*3600000)/60000)*60000)/1000) + T-floor(T/3600000)*3600000-floor((T-floor(T/3600000)*3600000)/60000)*60000-floor((T-floor(T/3600000)*3600000-floor((T-floor(T/3600000)*3600000)/60000)*60000)/1000)*1000;

end



