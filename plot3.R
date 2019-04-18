# Set working directory and import files
setwd("C:/Users/jnony/Desktop/exdata_data_NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balt <- subset(NEI, fips == 24510)
AggBalt <- aggregate(Emissions ~ year, Balt, sum)

library(ggplot2)
library(dplyr)
Balt_by_type <- Balt %>%
  group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))

png("plot3.png")
Balt_by_type_plot <- ggplot(data = Balt_by_type, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Baltimore Emissions by Source Type") 
print(Balt_by_type_plot)

dev.off()