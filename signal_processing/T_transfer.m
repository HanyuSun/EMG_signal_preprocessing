function [ Y ] = T_transfer( T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here T为带转换时间，及数据里的原始时间，Y为转换为时分秒毫秒形式的时间
Y = 1e7*floor(T/3600000) + 1e5*floor((T-floor(T/3600000)*3600000)/60000) + 1e3*floor((T-floor(T/3600000)*3600000-floor((T-floor(T/3600000)*3600000)/60000)*60000)/1000) + T-floor(T/3600000)*3600000-floor((T-floor(T/3600000)*3600000)/60000)*60000-floor((T-floor(T/3600000)*3600000-floor((T-floor(T/3600000)*3600000)/60000)*60000)/1000)*1000;

end



