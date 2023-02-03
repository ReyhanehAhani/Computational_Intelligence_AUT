function A = CalculateOutput(W, A_old)
    A_old_bias= AddBias(A_old);
    Z = W * A_old_bias;
    A = Sigmoid(Z);

end