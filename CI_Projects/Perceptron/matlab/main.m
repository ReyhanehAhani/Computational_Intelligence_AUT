M = [1 2 3;
     4 5 6;
     7 8 9
];

sigmatrix(M)
sigmatrix_d(M)
tanhmatrix(M)

subplot(3, 1, 1);
fplot(@sigmoid);
grid on;
title("Sigmoid");
legend("Sigmoid");
xlabel("X");
ylabel("Sigmoid");

subplot(3, 1, 2);
fplot(@sigmoid_d);
grid on;
title("Sigmoid derivative");
legend("Sigmoid derivative");
xlabel("X");
ylabel("Sigmoid derivative");

subplot(3, 1, 3);
fplot(@tanh);
grid on;
title("Tanh");
legend("Tanh");
xlabel("X");
ylabel("Tanh");

