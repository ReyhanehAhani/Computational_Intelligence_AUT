%% CI lab_Experiment2_Group1
clc
clear
close all

%% Importing data
cancer_data = importdata("wdbc.data");
x_data = cancer_data.data;
y_data = cancer_data.textdata;
y_data = y_data(:,2);

%% Normalizing x and changing the output to binary
x_size = size(x_data);
x = MinMaxScale(x_data,x_size(1),x_size(2));

y_size = size(y_data);
y = zeros(1,y_size(1));
for p = 1:y_size(1)
   if y_data(p) == "M"
       y(p) = 1;
   elseif y_data(p) == "B"
       y(p) = 0;
   end
end

%% Parameters
learning_rate = 0.05;
min_error = 0.01;
epoch = 500;

%% Training model
m = x_size(1);
n = x_size(2);
w = random_state(n);
b = random_state(1);
errors = zeros(1,epoch);
MSEs = zeros(1,epoch);

for k = 1:epoch 
    error = 0;
    mse = 0;
    for p = 1:m
        o = getoutput(x(p,:),w,b);
        w = w + learning_rate * (y(p) - o) * sigmoid_d(o) * x(p,:);
        b = b + learning_rate * (y(p) - o) * sigmoid_d(o);
        error = error + 0.5 * (y(p)- o)^2;
        mse = mse + (y(p)-o)^2;
    end
    errors(k) = error;
    MSEs(k) = mse/m;
    fprintf("> %d \t %f \n",k , error)
    
    if error < min_error
        break;
    end
end

%% Plotting the loss error & MSE 
figure('Name','Loss error & MSE','NumberTitle','off')

subplot(1,2,1);
x_axis = 1:epoch;
y1_axis = errors(x_axis);
plot(x_axis,y1_axis,'r--o')
title("Loss Error")
ylabel('loss error')
xlabel('epoch')
grid on

subplot(1,2,2);
y2_axis = MSEs(x_axis);
plot(x_axis,y2_axis,'g--*')
title("MSE")
ylabel("MSE")
xlabel('epoch')
grid on

%% Output Function
function [y] = getoutput(a,w,b)
    s = dot(w,a) + b;
    y = sigmoid(s);
end

%% Sigmoid Function
function [output] = sigmoid(a)
    output = (2.0/(1.0+exp(-a)))-1.0;
end

%% Derivative of the Sigmoid Function
function [output] = sigmoid_d(a)
    output = (2*exp(-a))/((1+exp(-a))^2);
end

%% Scaling Function
function [scaled] = MinMaxScale(x,m,n)
    scaled = zeros(m,n);
    for i=1:n
        feature = x(:,i);
        col = zeros(m,1);
            for j=1:m
                col(j) = (feature(j) - min(feature)) / ( max(feature) - min(feature) );
            end
        scaled(:,i) = col;
    end
end
 
%% Random Function
function [w] = random_state(n)
    w = rand(1,n);
end
