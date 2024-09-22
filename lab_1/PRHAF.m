function [H, theta, rho] = PRHAF(I, dtheta, drho)
    %PRHAF функция преобразования Хафа
    %I,H - входное и выходное изображения
    %dtheta, drho - шаги дискретизации плоскости Хафа
    %theta, rho - вектор значений параметров плоскости Хафа
    [M, N] = size(I);
    D = sqrt((M-1).^2 + (N-1).^2);
    n_theta = real_n_count(-90, 90, dtheta);
    n_rho = real_n_count(-D, D, drho);
    theta = linspace(-90, 90, n_theta);
    rho = linspace(-D, D, n_rho);

    H = zeros(n_rho, n_theta);
    [x,y,q] = null_pixel_count(I);
    for k=1:q
        for j=1:n_theta
            rho_count = x(k)*cos(theta(j)*pi/180) + y(k)*sin(theta(j)*pi/180);
            i = floor(((rho_count-rho(1))/drho)+1);
            H(i, j) = H(i,j) + 1;
        end
    end
end

