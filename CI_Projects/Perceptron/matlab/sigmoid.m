function y = sigmoid(x)
    y = (2 / (1 + exp(-x))) - 1;
end