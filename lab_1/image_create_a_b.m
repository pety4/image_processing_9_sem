function image = image_create_a_b(M, N,a,b,x_min, x_max)
    image = ones(M, N);
    for x = x_min:1:x_max
        y = a*x+b;
        image(x +1, floor(y+1)) = 0;
    end
end

