file = fopen("ratings.csv")
ratings = textscan(file, "%d %d %f %d", "Delimiter", ",", "HeaderLines", 1)
fclose(file)

ratingsMatrix = createRatingsMatrix(ratings);