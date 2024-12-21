function theta = GradientDescent(X, y, theta, alpha, iterations)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha
m = length(y);
 for iter = 1:iterations 
    % Compute the hypothesis
    h = X * theta;
    
    % Calculate the gradient
    gradient = (1/m) * (X' * (h - y));
    
    % Update theta values
    theta = theta - alpha * gradient;
     
end

     