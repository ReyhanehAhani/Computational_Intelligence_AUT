%% CIlab_HW5_RBF_Group1
clc;
clear;
close all;
%% Inputs and Targets
x = linspace(0,2*pi,100);
y = awgn(sin(x),20,'measured');

inputs = x;
targets = y;

%% Split to test and train data
nData = size(inputs,2);
Perm = randperm(nData);

% train data
pTrainData = 0.7;
nTrainData = round(pTrainData*nData);
trainInd = Perm(1:nTrainData);
Perm(1:nTrainData) = [];
trainInputs = inputs(:,trainInd);
trainTargets = targets(:,trainInd);

% test data
pTestData = 1-pTrainData;
nTestData = nData-nTrainData;
testInd = Perm;
testInputs = inputs(:,testInd);
testTargets = targets(:,testInd);


%% Create a Fitting Network
Goal = 0;      % Mean squared error goal
Spread = 1;    % Spread of radial basis functions
MaxNeuron = 2; % Maximum number of neurons
DisplayAt = 1; % Number of neurons to add between displays
net = newrb(trainInputs,trainTargets,Goal,Spread,MaxNeuron,DisplayAt);

%% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets, outputs);

%% Recalculate Training and Test Performance

trainOutputs = outputs(:,trainInd);
trainErrors = trainTargets-trainOutputs;
trainPerformance = perform(net,trainTargets,trainOutputs);

testOutputs = outputs(:,testInd);
testError = testTargets-testOutputs;
testPerformance = perform(net,testTargets,testOutputs);

%% View the Network
view(net);

%% plot
PlotResults(targets,outputs,'All Data');
PlotResults(trainTargets,trainOutputs,'Train Data');
PlotResults(testTargets,testOutputs,'Test Data');
