function ratingPrediction = predictRating(userIdx, movieIdx, ratingsMatrix, n)
    similarUsers = findSimilarUsers(userIdx, ratingsMatrix, n);
    % Get the ratings for the movie movideIdx by the n most smilar users.
    movieRatings = ratingsMatrix(similarUsers(:, 1), movieIdx);
    s = similarUsers(:, 2);
    
    % We eliminate the similarity score of all those users, that have not
    % yet rated for the given movie.
    mask = movieRatings > 0;
    sSum = sum(s .* mask);

    if sSum > 0
        ratingPrediction = sum(s .* movieRatings) / sSum;
    else
        ratingPrediction = 0;
    end
end