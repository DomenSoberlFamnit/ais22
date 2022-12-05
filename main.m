file = fopen('movies.csv');
data = textscan(file, '%d %q %s', 'delimiter', ',', 'headerlines', 1);
fclose(file);

movies = recommendMovies("Toy Story (1995)", data, 10)
