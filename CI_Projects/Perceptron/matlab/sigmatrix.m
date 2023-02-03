function s = sigmatrix(A)
    s = sum(arrayfun(@sigmoid, A), 'all');
end