function image_with_line = image_with_line_based_on_two_points_create(M, N, x_1, x_2, y_1, y_2, x_min, x_max)
%функция создания изображения с прямой линией, построенной по 2 точкам
    a = (y_2 - y_1)/(x_2 - x_1);
    b = y_1 - a*x_1;
    image_with_line = image_with_line_based_on_two_koef_create(M, N, a, b, x_min, x_max);
end