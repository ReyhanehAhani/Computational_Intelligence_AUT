%% CI lab_HW4_Group1
clc;
clear;
close all;
%% Load Data
x = CreateData(5000);

%% K-Means Settings
nCluster = 3;                            % Number of Clusters
DistanceMetric = 'cityblock';            % Sum of absolute differences
Options = statset('Display','final');    % Displays results of the final iteration

%% Run K-Means
[I,C] = kmeans(x,nCluster,'Distance',DistanceMetric,'Options',Options);

%% Plot results
figure('Name','K-mean clustering','NumberTitle','off')
plot(x(I==1,1),x(I==1,2),'r.');
hold on;
plot(x(I==2,1),x(I==2,2),'b.');
plot(x(I==3,1),x(I==3,2),'m.');

plot(C(:,1),C(:,2),'kx','LineWidth',2,'MarkerSize',14);

legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centers');

xlabel('x_1');
ylabel('x_2');

hold off;

%% Creating data for clustering
function x = CreateData(m)
    
    x1A = 1;
    x2A = 1;
    xA = [x1A + randn(m,1) x2A + randn(m,1)];
    
    x1B = 6;
    x2B = 2;
    xB = [x1B + randn(m,1) x2B + randn(m,1)];
    
    x1C = 3;
    x2C = 5;
    xC = [x1C + randn(m,1) x2C+randn(m,1)];
    
    x = [xA;xB;xC];
end 

