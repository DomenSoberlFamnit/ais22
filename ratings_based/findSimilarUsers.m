function similarUsers = findSimilarUsers(userIdx, ratingsMatrix, n)
    user1 = ratingsMatrix(userIdx, :);
    scores = zeros(height(ratingsMatrix), 2);

    for i = 1:height(ratingsMatrix)
        user2 = ratingsMatrix(i, :);
        scores(i, 1) = i;
        scores(i, 2) = userSimilarity(user1, user2);
    end

    scores(userIdx, :) = [];
    scores = sortrows(scores, 2, 'descend');
    similarUsers = scores(1:n, :);
end