function theta = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

m = length(y); % Number of training examples
for iter = 1:num_iters
    % Compute the hypothesis
    h = X * theta;
    
    % Calculate the gradient
    gradient = (1/m) * (X' * (h - y));
    
    % Update theta values
    theta = theta - alpha * gradient;
    
    % Display the cost every 100 iterations for monitoring
    if mod(iter, 100) == 0
        J = computeCost(X, y, theta);
        fprintf('Cost after iteration %d: %f\n', iter, J);
    end
end
end
