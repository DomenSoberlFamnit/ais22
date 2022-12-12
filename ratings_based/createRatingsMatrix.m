function matrix = createRatingsMatrix(ratings)
    m = max(ratings{1});
    n = max(ratings{2});
    matrix = zeros(m, n);

    for i = 1:length(ratings{1})
        userId = ratings{1}(i);
        movieId = ratings{2}(i);
        rating = ratings{3}(i);

        matrix(userId, movieId) = rating;
    end
end

