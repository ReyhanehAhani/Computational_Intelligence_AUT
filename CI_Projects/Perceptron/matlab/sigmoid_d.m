function y = sigmoid_d(x)
    y = (1 - (sigmoid(x)^2)) / 2;
end