% Load the data
data = load('hw1_data1.txt');
X = data(:, 1); % Sales
y = data(:, 2); % Revenue

% Given slope and intercept
slope = 0.0528;
intercept = 3.35;

% Calculate the predicted values (yPred)
yPred = slope * X + intercept;

% Calculate Residual Sum of Squares (RSS)
residuals = y - yPred; % Calculate residuals
RSS = sum(residuals.^2); % Calculate RSS

% Calculate Total Sum of Squares (TSS)
meanY = mean(y); % Mean of actual values
TSS = sum((y - meanY).^2); % Calculate TSS

% Calculate R² value
R2 = 1 - (RSS / TSS); % Calculate R²

% Display results
fprintf('Predicted values (yPred):\n');
disp(yPred);
fprintf('Residual Sum of Squares (RSS): %.2f\n', RSS);
fprintf('Total Sum of Squares (TSS): %.2f\n', TSS);
fprintf('R² value: %.2f\n', R2);

