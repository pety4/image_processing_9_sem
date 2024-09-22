function image_with_line = image_with_line_based_on_two_koef_create(M, N, a, b, x_min, x_max)
%функция создания изображения с прямой линией, построенной по 2
%коэффициентам
    image_with_line = ones(M, N);
    for x = x_min:1:x_max
        y = a*x+b;
        image_with_line(x +1, floor(y+1)) = 0;
    end
end

