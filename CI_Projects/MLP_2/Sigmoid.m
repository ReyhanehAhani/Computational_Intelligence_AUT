function o = Sigmoid(i)
    o = 1 ./ (1+exp(-1 .* i));
end