path <- "R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Data Visualization Project/Economist_Assignment_Data.csv"
library(data.table)
df <- fread(path, drop=1)
View(df)

library(ggplot2)
pl <- ggplot(df, aes(x=CPI, y=HDI, color=Region)) + geom_point(size=5, shape=1)
pl2 <- pl + geom_smooth(aes(group=1), method='lm', formula=y ~ log(x), se=F, color='red')
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

pl4 <- pl3 + theme_bw() + scale_x_continuous(name="Corruption Perceptions Index, 2011 (10=least corrupt)", limits=c(0.5,10.5), breaks=(1:10))
pl5 <- pl4 + scale_y_continuous(name="Human Development Index, 2011 (1=Best)", limits=c(NA,NA))
pl6 <- pl5 + ggtitle("Corruption and Human Development") +
  theme(plot.title = element_text(hjust = 0.5))
pl6