function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];

% Ensure X is a column vector
X = X(:);

% Initialize the output matrix
X_poly = zeros(numel(X), p);

% Compute polynomial features using vectorized operations
for j = 1:p
    X_poly(:, j) = X.^j;
end

end
