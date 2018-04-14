% ����ͼƬ
I1 = imread('moon.jpg');
I2 = imread('earth.jpg');
I3 = imread('sun.jpg');
I1 = flip(I1, 1);
I2 = flip(I2, 1);
I3 = flip(I3, 1);

% ���ò�����ȡ����뾶Ϊ1
earth_r = 3.67;  % ����İ뾶�������3.67��
distance = 10;  % ����֮�����
sun_r = 10;  % ̫��뾶�������10������С��
distance_s_e = 30;  % �յ�֮����루��С��
[x,y,z] = ellipsoid(0,0,0,sun_r,sun_r,sun_r,100);  % ̫��
[x1,y1,z1] = ellipsoid(distance_s_e,distance_s_e,0,earth_r,earth_r,earth_r,100);  % ����
[x2,y2,z2] = ellipsoid(distance_s_e+distance,distance_s_e+distance,0,1,1,1,100);  % ����
direction = [0 0 1];

% һЩ����
rotate3d on
axis vis3d
hold on
%grid on
view(3)

% ��������͹�Դ
moon = surf(x2,y2,z2, 'FaceColor', 'texturemap', 'CData', I1, 'EdgeColor', 'none');shading flat
earth = surf(x1,y1,z1, 'FaceColor', 'texturemap', 'CData', I2, 'EdgeColor', 'none');shading flat
sun = surf(x,y,z,'FaceColor', 'texturemap', 'CData', I3, 'EdgeColor', 'none','facealpha',0.5);shading flat
light('position',[10,0,0],'style','local');
light('position',[0,10,0],'style','local');
light('position',[0,0,10],'style','local');
light('position',[-10,0,0],'style','local');
light('position',[0,-10,0],'style','local');
light('position',[0,0,-10],'style','local');
lighting phong ;
axis([-60 60 -60 60 -20 20])

% ���ƹ켣
alpha = 0:pi/100:2*pi;
x_e = 1.414*distance_s_e*cos(alpha); 
y_e = 1.414*distance_s_e*sin(alpha); 
z_e = 0*alpha;
plot3(x_e,y_e,z_e,'--');  % ����Ĺ켣

angle_e = 45;
angle_m = 45;
while(1)
    angle_e = angle_e + 1;
    angle_m = angle_m + 3;
    
    [x_new,y_new] = lunar_orbit(0,0,1.414*distance_s_e,1.414*distance,angle_e,angle_m);
    [x2_new, y2_new, z2_new] = ellipsoid(x_new, y_new, 0, 1, 1, 1, 100);
    set(moon, 'XData', x2_new, 'YData', y2_new, 'ZData', z2_new);  % �����������꣬���Ƶ���ת��Ч����ÿ֡3��
    rotate(moon,direction,3, [x_new,y_new,0]);  % ����ת���ĽǶȣ���ת��ÿ֡3��
    rotate(earth,direction,1,[x,y,z]); % ÿ֡ת��1�㣬������̫��ת
    x_earth = 1.414*distance_s_e * cosd(angle_e);  % ��������x����
    y_earth = 1.414*distance_s_e * sind(angle_e);  % ��������y����
    rotate(earth,direction,5,[x_earth,y_earth,0]);  % ������ת��ÿ֡5��
    rotate(sun,direction,1,[0,0,0]);  % ̫����ת��ÿ֡1��
    pause(0.01);  % 100Hzˢ����
end