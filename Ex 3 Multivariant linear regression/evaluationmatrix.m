function evaluationmatrix(predictions, actual)
% EVALUATIONMATRIX Computes and displays various evaluation metrics
% This function calculates the Mean Absolute Error (MAE), Mean Squared Error (MSE),
% Root Mean Squared Error (RMSE), and R-squared (R^2) for regression model evaluation.
%
% Input:
%   predictions - A vector of predicted values from the regression model
%   actual - A vector of actual values (ground truth)
%
% Output:
%   Displays the calculated evaluation metrics.

    % Ensure the input vectors are column vectors
    predictions = predictions(:);
    actual = actual(:);

    % Mean Absolute Error (MAE)
    mae = mean(abs(predictions - actual));

    % Mean Squared Error (MSE)
    mse = mean((predictions - actual).^2);

    % Root Mean Squared Error (RMSE)
    rmse = sqrt(mse);

    % R-squared (Coefficient of Determination)
    ss_total = sum((actual - mean(actual)).^2);
    ss_residual = sum((actual - predictions).^2);
    r_squared = 1 - (ss_residual / ss_total);

    % Display the metrics
    fprintf('Mean Absolute Error (MAE): %f\n', mae);
    fprintf('Mean Squared Error (MSE): %f\n', mse);
    fprintf('Root Mean Squared Error (RMSE): %f\n', rmse);
    fprintf('R-squared (R^2): %f\n', r_squared);
    fprintf('\n');
end
