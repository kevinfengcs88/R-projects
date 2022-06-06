csv_path <- "R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Capstone Project/Batting.csv"

batting <- read.csv(csv_path)

# add batting average column to data.frame
batting$BA <- batting$H/batting$AB

# add on base percentage stat
batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)

# add slugging stat
batting$SLG <- (batting$H - batting$X2B - batting$X3B - batting$HR + 2 * batting$X2B + 3 * batting$X3B + 4 * batting$HR)/batting$AB

csv_path <- "R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Capstone Project/Salaries.csv"

# read salary data
sal <- read.csv(csv_path)

# subset of batting data including data from 1985 and onwards
new_batting <- subset(batting, yearID >= 1985)

# merge salary and batting data
combined_data <- merge(new_batting, sal, by=c('playerID', 'yearID'))

# getting subset of lost players
lost_players <- subset(combined_data, playerID %in% c('damonjo01', 'giambja01', 'saenzol01'))
lost_players <- subset(lost_players, yearID==2001)
lost_players <- lost_players[,c('playerID', 'H', 'X2B', 'X3B', 'HR', 'OBP', 'SLG', 'BA', 'AB')]


# sort combined data to find replacement players
library(dplyr)
sorted_combined_data <- arrange(combined_data, salary, desc(AB), desc(OBP))
sorted_combined_data <- sorted_combined_data[, c('playerID', 'AB', 'OBP', 'salary')]

# solution:
# jamesdi01 - costs 0
# colemvi01 - costs 60k
# seitzke01 - costs 62.5k

# cannot exceed 15 mil
# spend less than 150k
# spent 0.8166% of budget
# or 0.008166 of budget, equivalent to 
# 99.18% off
