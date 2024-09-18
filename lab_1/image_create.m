function image = image_create(M, N, x_1, x_2, y_1, y_2, x_min, x_max)
%создание изображения
image = ones(M, N);
a = (y_2 - y_1)/(x_2 - x_1);
b = y_1 - a*x_1;
for x = x_min:1:x_max
    y = a*x+b;
    image(x +1, round(y+1)) = 0;
end
end