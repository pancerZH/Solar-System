function [x_moon, y_moon] = lunar_orbit(x_sun, y_sun, distance_s_e, distance_e_m, angle_e, angle_m)
%lunar_orbi 计算当前月球的x，y坐标
%   x_sun：太阳的x坐标
%   y_sum：太阳的y坐标
%   distance_s_e：太阳和地球之间的距离
%   distance_e_m：地球和月球之间的距离
%   angle_e：地球已经转过的角度
%   angle_m：月球已经转过的角度

x_earth = x_sun + distance_s_e * cosd(angle_e);  % 计算地球的x坐标
y_earth = y_sun + distance_s_e * sind(angle_e);  % 计算地球的y坐标
x_moon = x_earth + distance_e_m * cosd(angle_m);  % 计算月球的x坐标
y_moon = y_earth + distance_e_m * sind(angle_m);  % 计算月球的y坐标
end

