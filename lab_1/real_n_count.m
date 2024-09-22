function n = real_n_count(x_min, x_max, dx)
    %функция расчета реального числа разбиений отрезка от x_min до x_max с
    %шагом dx 
    n = ceil(x_max-x_min/dx);
end

