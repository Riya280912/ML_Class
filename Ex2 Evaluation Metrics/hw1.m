%giving the data
yPred = [3.5; 4.5; 8.5; 7];
yActual = [3.9; 5.5; 9.0; 6.0];

%calling the function - evaluateRegressionModel to find the evaluation
%metrics
metrics = evaluationmetrics(yPred, yActual);

%displaying the metrics 
disp(metrics);
