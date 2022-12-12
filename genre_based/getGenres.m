function [genresAll, count] = getGenres(data)
    datasize = size(data{1});
    moviecount = datasize(1);

    genres = cell(0);

    for i = 1:moviecount
        s = split(data{3}(i), '|');
        for j=1:size(s)
            genres(end+1) = s(j);
        end

    end
    genresAll = unique(genres);
    genressize = size(genresAll);
    genrescount = genressize(2);

    count = [];
    for i = 1: genrescount
        count(end+1) = sum(genres == string(genresAll{i}));
    end
end