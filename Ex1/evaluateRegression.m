function [MAE, MSE, RMSE, RMSLE, R2, AdjR2] = evaluateRegression(yActual, yPred)
    % Function to calculate regression metrics: 
    % MAE, MSE, RMSE, RMSLE, R2, and Adjusted R2
    % Input: yActual (actual values), yPred (predicted values)
    % Output: MAE, MSE, RMSE, RMSLE, R2, AdjR2

    % Check if inputs are provided
    if nargin < 2
        error('Not enough input arguments. Provide both yActual and yPred.');
    end

    % Ensure yActual and yPred are column vectors
    if isrow(yActual)
        yActual = yActual';
    end
    if isrow(yPred)
        yPred = yPred';
    end

    % Number of observations (n) and features (p)
    n = length(yActual);
    if n ~= length(yPred)
        error('yActual and yPred must have the same length.');
    end

    p = 1; % For simple regression, p = 1 (single feature)

    % 1. Mean Absolute Error (MAE)
    MAE = mean(abs(yActual - yPred));

    % 2. Mean Square Error (MSE)
    MSE = mean((yActual - yPred).^2);

    % 3. Root Mean Square Error (RMSE)
    RMSE = sqrt(MSE);

    % 4. Root Mean Log Square Error (RMSLE)
    % RMSLE requires positive values for the log calculation
    if any(yPred < 0) || any(yActual < 0)
        RMSLE = NaN; % Set RMSLE to NaN if negatives are present
        warning('RMSLE cannot be calculated due to negative values in yActual or yPred.');
    else
        RMSLE = sqrt(mean((log1p(yPred) - log1p(yActual)).^2));
    end

    % 5. R-squared (R2)
    SS_Residual = sum((yActual - yPred).^2);
    SS_Total = sum((yActual - mean(yActual)).^2);
    R2 = 1 - (SS_Residual / SS_Total);

    % 6. Adjusted R-squared (Adjusted R2)
    AdjR2 = 1 - ((1 - R2) * (n - 1)) / (n - p - 1);
end
