%% Initialization
clear ; close all; clc

% Load the dataset
fprintf('Loading Data ...\n');
data = readmatrix('advertisement.xlsx'); % Adjust filename/path if necessary

% Extract columns
TV = data(:, 1);          % Advertisement spending on TV
Radio = data(:, 2);       % Advertisement spending on Radio
Newspaper = data(:, 3);   % Advertisement spending on Newspaper
Sales = data(:, 4);       % Sales data

% Plot the data
fprintf('Plotting Multivariate Data ...\n');

% Create a figure with subplots
figure;

% TV vs Sales
subplot(3, 1, 1);
plot(TV, Sales, 'bo', 'MarkerSize', 6);
xlabel('TV Advertisement Spending');
ylabel('Sales');
title('TV vs Sales');
grid on;

% Radio vs Sales
subplot(3, 1, 2);
plot(Radio, Sales, 'r^', 'MarkerSize', 6);
xlabel('Radio Advertisement Spending');
ylabel('Sales');
title('Radio vs Sales');
grid on;

% Newspaper vs Sales
subplot(3, 1, 3);
plot(Newspaper, Sales, 'gs', 'MarkerSize', 6);
xlabel('Newspaper Advertisement Spending');
ylabel('Sales');
title('Newspaper vs Sales');
grid on;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Cost and Gradient descent ===================
y = data(:,4);
m = length(y);
X = [ones(m, 1), data(:,1:3)]; % Add a column of ones to x

% Normalize features
mu = mean(X(:, 2:end)); % Mean of features
sigma = std(X(:, 2:end)); % Standard deviation of features
X(:, 2:end) = (X(:, 2:end) - mu) ./ sigma; % Feature normalization

% Normalize Sales
y_mean = mean(y);
y_std = std(y);
y = (y - y_mean) ./ y_std;

theta = zeros(4, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 500;
alpha = 0.01;

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost
J = ComputeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
theta = GradientDescent(X, y, theta, alpha, iterations);

% Denormalize theta to interpret it in original scale
theta(1) = theta(1) * y_std + y_mean; % Adjust intercept
theta(2:end) = theta(2:end) .* (y_std ./ sigma'); % Adjust coefficients

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

%Calculate the correlation matrix
fprintf('Calculating correlation matrix...\n');

% Combine features into a matrix
features = [TV, Radio, Newspaper];

% Compute the correlation matrix
correlationMatrix = corr(features);

% Display the correlation matrix
disp('Correlation Matrix:');
disp(correlationMatrix);

% Checking the correlation between Radio and Newspaper
fprintf('Correlation between Radio and Newspaper: %f\n', correlationMatrix(2, 3));

% Drop Newspaper if the correlation is strong (threshold 0.8)
if abs(correlationMatrix(2, 3)) > 0.3
    fprintf('Dropping Newspaper feature due to high correlation with Radio.\n');
    features = features(:, 1:2); % Retain only TV and Radio
else
    fprintf('Keeping all features as correlation is not significant.\n');
end

% Prepare data for model training
X = [ones(size(features, 1), 1), features]; % Add bias term (column of ones)
y = Sales;

% Normalize features
mu = mean(X(:, 2:end)); % Mean of features
sigma = std(X(:, 2:end)); % Standard deviation of features
X(:, 2:end) = (X(:, 2:end) - mu) ./ sigma; % Feature normalization

% Normalize Sales
y_mean = mean(y);
y_std = std(y);
y = (y - y_mean) ./ y_std;

fprintf('Updated feature matrix size: %dx%d\n', size(X, 1), size(X, 2));

theta = zeros(3, 1); % initialize fitting parameters
 
% Some gradient descent settings
iterations = 500;
alpha = 0.01;

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost
J = ComputeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
theta = GradientDescent(X, y, theta, alpha, iterations);

% Denormalize theta to interpret it in original scale
theta(1) = theta(1) * y_std + y_mean; % Adjust intercept
theta(2:end) = theta(2:end) .* (y_std ./ sigma'); % Adjust coefficients

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

% Final model:
fprintf('Final Model: Sales = %.2f + %.3f*TV + %.3f*Radio\n', theta(1), theta(2), theta(3));