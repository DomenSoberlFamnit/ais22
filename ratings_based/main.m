file = fopen("ratings.csv")
ratings = textscan(file, "%d %d %f %d", "Delimiter", ",", "HeaderLines", 1)
fclose(file)

ratingsMatrix = createRatingsMatrix(ratings);

user1 = ratingsMatrix(6,:);
user2 = ratingsMatrix(8,:);

prediction = predictRating(1, 1, ratingsMatrix, 100)