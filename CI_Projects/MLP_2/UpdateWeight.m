function W_new = UpdateWeight(W_old, rate, E, A_old)
    A_old_bias= AddBias(A_old);
    W_new = W_old - rate * E *A_old_bias';
end