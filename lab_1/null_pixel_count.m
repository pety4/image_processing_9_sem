function [x,y,q] = null_pixel_count(image)
    %функция подсчёта и определения координат нулевых пикселей на изображении
    [M, N] = size(image);
    x = [];
    y = [];
    q = 0;
    for i = 1:1:M
        for j=1:1:N
            if image(i,j) == 0
                x(end + 1) = i - 1;
                y(end + 1) = j - 1;
                q = q + 1;
            end
        end
    end
end

