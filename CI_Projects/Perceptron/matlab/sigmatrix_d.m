function s = sigmatrix_d(A)
    s = sum(arrayfun(@sigmoid_d, A), 'all');
end