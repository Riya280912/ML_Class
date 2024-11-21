function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% Compute the hypothesis (predicted values)
h = X * theta;

% Compute the squared errors
squaredErrors = (h - y) .^ 2;

% Compute the cost
J = (1 / (2 * m)) * sum(squaredErrors);

end
