%% CI lab_Experiment3_Group1
clear
close all
clc

%% Xor dataset
X = [0 0;0 1;1 0;1 1];
Y = [0;1;1;0];

%% Parameters
layers = 2;              % number of layers
rate = 0.5;              % learning rate
epoch = 1000;            % number of epochs
min_error = 0.1;         % minimum error
N = size(Y,1);           
errors = zeros(1,epoch); 

%% Initialing 
O = zeros(N,1);   
W{layers} = [];      % cell array of weights
A{layers+1} = [];    % cell array of outputs
E{layers} = [];      % cell array of errors

W{1} = rand(2,3);    % random initialing weights
W{2} = rand(1,3);    % W{k} --> k-th layer of perceptron

%% Training
for i = 1:epoch
    
    for P = 1:N
        
       %Forward Pass
       A{1} = X(P,:)';              % input of perceptron is the first cell of A          
       for j = 2:layers+1
          A{j} = CalculateOutput(W{j-1},A{j-1});
       end
       
       O(P,1) = A{layers+1};        % output of perceptron is the last cell of A

       %Error calculation
       E{layers} = (A{layers+1}-Y(P,1)) .* SigmoidDerivative(A{layers+1});
       for k = layers-1 : -1 : 1
          E{k} = CalculateError(E{k+1},W{k+1},A{k+1});
       end
       errors(i) = E{layers};
       
       % Weight updating with delta rule
       W{layers} = UpdateWeight(W{layers}, rate, E{layers}, A{layers});
       for k = layers-1 : -1 : 1
          W{k} = UpdateWeight(W{k},rate,E{k},A{k}); 
       end

    end
    O
    if E{layers} < min_error
        break;
    end
    
end

%% Plotting the loss error

figure('Name','Error','NumberTitle','off')
x_axis = 1:epoch;
y1_axis = errors(x_axis);
plot(x_axis,y1_axis,'r-o')
title("Error")
ylabel('error')
xlabel('epoch')
grid on

