function e = CalculateError(E_next, W, A_now)
    t = W' * E_next;
    t = t(2:end);
    e = t .* SigmoidDerivative(A_now);
    
end