function movies = recommendMovies(title, data, count)
    [titles, genres, matrix] = generateGenreMatrix(data);
    
    % Check if the given title is contained in the database.
    if sum(titles == title) == 0
        movies = []; % If not, we return an empty array.
        return
    end
    
    % We construct a new matrix that excludes the given movie and contains
    % the 'distance' column.
    matrixWithDistances = zeros(length(titles) - 1, length(genres) + 2);
    
    % Where in the original matrix the given movie is?
    givenTitleRow = find(titles == title);
    
    % The genre matrix of the given movie.
    v0 = matrix(givenTitleRow, :);
    
    % Loop through all the movies.
    j = 1;
    for i = 1:length(titles)
        if i == givenTitleRow
            continue
        end
        
        v1 = matrix(i, :); % The genre matrix of the i-th movie.
        d = sum(v0 ~= v1); % Distance between movies.
        
        % Insert the movie ID.
        matrixWithDistances(j, 1) = i;
        
        % Insert the genre values into the new matrix.
        matrixWithDistances(j, 2:end-1) = v1;
        
        % Insert the computed distance.
        matrixWithDistances(j, end) = d;
        
        % Increase the index for the matrixWithDistances.
        j = j + 1;
    end
    
    % Sort by distances.
    matrixWithDistances = sortrows(matrixWithDistances, length(genres) + 2);
    
    % Get the recommended IDs.
    recommendedIds = matrixWithDistances(1:count, 1);
    
    % Convert the IDs to movie titles.
    movies = titles(recommendedIds);
end

