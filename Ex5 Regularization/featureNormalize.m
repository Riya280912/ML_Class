function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% Calculate mean for each feature
mu = mean(X);

% Subtract the mean (broadcasting subtraction for all rows)
X_norm = X - mu;

% Calculate the standard deviation for each feature
sigma = std(X_norm);

% Divide by the standard deviation (element-wise division for normalization)
X_norm = X_norm ./ sigma;

end
