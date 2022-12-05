function [movies,genres,matrix] = generateGenreMatrix(data)
    genres = getGenres(data);
    
    movieCount = length(data{2});
    genreCount = length(genres);
    
    movies = string(data{2});
    matrix = zeros(movieCount, genreCount);
    
    for i = 1:movieCount
        movieGenres = split(string(data{3}{i}), "|");
        for j = 1:length(movieGenres)
            movieGenre = movieGenres(j);
            col = find(genres == movieGenre);
            matrix(i, col) = 1;
        end
    end
end

