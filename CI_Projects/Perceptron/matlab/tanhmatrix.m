function s = tanhmatrix(A)
    s = sum(arrayfun(@tanh, A), 'all');
end