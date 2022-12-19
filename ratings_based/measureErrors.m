function [mae, rmse, rnd_mae, rnd_rmse] = measureErrors(ratings, sampleSize, n)
    rnd_perm = randperm(length(ratings{1}));
    rnd_idx = rnd_perm(1:sampleSize);

    user_sample = ratings{1}(rnd_idx);
    movie_sample = ratings{2}(rnd_idx);
    rating_sample = ratings{3}(rnd_idx);
    
    ratingsMatrix = createRatingsMatrix(ratings);

    mae = 0;
    rmse = 0;
    rnd_mae = 0;
    rnd_rmse = 0;

    for i = 1:sampleSize
        userIdx = user_sample(i);
        movieIdx = movie_sample(i);
        rating = rating_sample(i);
        
        prediction = predictRating(userIdx, movieIdx, ratingsMatrix, n);
        randomPrediction = 0.5 + 4.5 * rand();

        error = abs(prediction - rating);
        mae = mae + error;
        rmse = rmse + error^2;

        randomError = abs(randomPrediction - rating);
        rnd_mae = rnd_mae + randomError;
        rnd_rmse = rnd_rmse + randomError^2;
    end

    mae = mae / sampleSize;
    rmse = sqrt(rmse / sampleSize);
    rnd_mae = rnd_mae / sampleSize;
    rnd_rmse = sqrt(rnd_rmse / sampleSize);
end