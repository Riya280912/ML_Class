 function metrics = evaluationmetrics(yPred, yActual)
    % Ensuring yPred and yActual are column vectors
    yPred = yPred';
    yActual = yActual';
    
    % Checking if the sizes of yPred and yActual are the same
    if length(yPred) ~= length(yActual)
        error('yPred and yActual must be of the same size.');
    end
    
    % Number of observations
    m = length(yPred);
    
    % Mean of actual values
    yMean = mean(yActual);
    
    % Absolute Mean Error
    MAE = mean(abs(yPred - yActual));
    
    % Mean Squared Error
    MSE = mean((yPred - yActual).^2);
    
    % Root Mean Squared Error
    RMSE = sqrt(MSE);
    
    % Root Mean Log Squared Error
    RMLSE = sqrt(mean((log(yActual+1)-log(yPred+1).^2)));
    
    % R-squared
     MSEmodel = (1/m)*sum((yActual - yPred).^2);
    MSEbaseline = (1/m)*sum((yActual - yMean).^2);
    R2 = 1 - (MSEmodel/ MSEbaseline);
    
    % Adjusted R-squared 
    n=3;
    Adj_R2 = 1 - ((1 - R2) * (m - 1) / (m -(n+1)));
   
    % Collecting metrics into a structure
    metrics.MAE = MAE;
    metrics.MSE = MSE;
    metrics.RMSE = RMSE;
    metrics.RMLSE = RMLSE;
    metrics.R2 = R2;
    metrics.Adj_R2 = Adj_R2;
end
