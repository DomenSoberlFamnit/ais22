function similarity = userSimilarity(user1, user2)
    mask = user1 .* user2 > 0;
    user1 = user1 .* mask;
    user2 = user2 .* mask;

    dotproduct = dot(user1, user2);
    normproduct = norm(user1) * norm(user2);
    if normproduct == 0
        similarity = 0;
    else
        similarity = dotproduct / normproduct;
    end
end