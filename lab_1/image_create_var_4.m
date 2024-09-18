function image = image_create_var_4()
%создание изображения согласно варианту №7
M = 101;
N = 101;
x_1 = 0;
y_1 = 50;
x_2 = 50;
y_2 = 100;
x_min = 0;
x_max = 50;
image = image_create(M, N, x_1, x_2, y_1, y_2, x_min, x_max);
end

