function [H, theta, rho] = PRHAF(I, dtheta, drho)
    %PRHAF функция преобразования Хафа
    %I,H - входное и выходное изображения
    %dtheta, drho - шаги дискретизации плоскости Хафа
    %theta, rho - вектор значений параметров плоскости Хафа
    theta = -90:dtheta:90;
    [M, N] = size(I);
    D = sqrt((M-1).^2 + (N-1).^2);
    rho = -D:drho:D;
    n_theta = length(theta);
    n_rho = length(rho);
    H = zeros(n_rho, n_theta);
    [x,y,q] = null_pixel_count(I);
    for k=1:q
        for j=1:n_theta
            rho_count = x(k)*cos(theta(j)*pi/180) + y(k)*sin(theta(j)*pi/180);
            i = floor(((rho_count-rho(1))/drho)+1);
%             if i > 283
%                 i=283;
%             end
            H(i, j) = H(i,j) + 1;
        end
    end
end

