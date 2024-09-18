clear all;
close all;
image = image_create_var_7();
%figure();
%imshow(image);
dtheta = 0.5;
drho = 1;%TODO - добавить определение шага из методички стр 75

[image_haf, theta, rho] = PRHAF(image, dtheta, drho);
figure();
imshow(image_haf,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho'); 
axis on, axis normal;

[rho_max_index, theta_max_index] = find(image_haf == max(image_haf,[],"all"));
rho_max = rho(rho_max_index(1));
theta_max = theta(theta_max_index(1));
a_max = -cos(theta_max*pi/180)/sin(theta_max*pi/180);
b_max = rho_max/sin(theta_max*pi/180);
x_min = 60;
x_max = 100;

y_min =  a_max*x_min+b_max;
y_max = a_max*x_max+b_max;

alpha=-90;
x_min_new=x_min*cosd(alpha)-y_min*sind(alpha);
y_min_new=x_min*sind(alpha)-y_min*cosd(alpha);

x_max_new=x_max*cosd(alpha)-y_max*sind(alpha);
y_max_new=x_max*sind(alpha)-y_max*cosd(alpha);

a_new = (y_max_new - y_min_new)/(x_max_new - x_min_new);
b_new = y_min_new - a_new*x_min_new;

x_new = 0:101;
y_new = a_new*x_new+b_new;

% for x = x_min:1:x_max
%     y = a_max*x+b_max;
%     image(x +1, floor(y+1)) = 0;
% end

new_image = image_create_a_b(101,101,a_max,b_max,x_min,x_max);
figure();
imshow(image);
hold on;
plot(x_new, y_new+100);
%plot(y,x);
%figure();
%imshow(new_image);


