clear all;
close all;
%% Инициализация начальных переменных
global M  N x_1 y_1 x_2 y_2 x_min x_max;
init_var_7();
dtheta = 0.5;
drho = 1;
%% Построение исходного изображения
image = image_with_line_based_on_two_points_create(M, N, x_1, x_2, y_1, y_2, x_min, x_max);
figure();
imshow(image);
xlabel('y'), ylabel('x'); 
axis on;
title('Исходное изображение');
%% Построение проекции исходного изображения на плоскость Хафа
[image_haf, theta, rho] = PRHAF(image, dtheta, drho);
figure();
imshow(image_haf,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho'); 
axis on, axis normal;
title('Проекция исходного изображения на плоскость Хафа')
%% Определение коэффициентов уравнения прямой
[rho_max_index, theta_max_index] = find(image_haf == max(image_haf,[],"all"));
rho_max = rho(rho_max_index(1));
theta_max = theta(theta_max_index(1));
a_max = -cos(theta_max*pi/180)/sin(theta_max*pi/180)
b_max = rho_max/sin(theta_max*pi/180)
%% Построение прямой на исходном изображении
for x = x_min:1:x_max
     y = a_max*x+b_max;
     image(x +1, floor(y+1)) = 0;
end
figure();
imshow(image);
xlabel('y'), ylabel('x'); 
axis on;
title('Полученное изображение');

