%loading the given data
data = load("hw1_data1.txt");
y_actual = data(:,2);
x = data(:,1);

%length of the given data
m = length(x);

slope = 0.0528;
intercept = 3.35;

%finding the hypothesis
y_pred = slope*x + intercept;

%finding Residual Sum of squares error
RSS = sum((y_actual-y_pred).^2);

%finding the total sum of squares
y_mean = mean(y_actual);
TSS = sum((y_actual - y_mean).^2);

%finding the R^2 value
R2 = 1-(RSS/TSS);

% Displaying the results
fprintf('Residual Sum of Squares (RSS): %.2f\n', RSS);
fprintf('Total Sum of Squares (TSS): %.2f\n', TSS);
fprintf('R^2 value: %.2f\n', R2);