# Set working directory and import files
setwd("C:/Users/jnony/Desktop/exdata_data_NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



NEISCC <- merge(NEI, SCC, by = "SCC")

Coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)

coalNEISCC <- NEISCC[Coal, ]
coal_aggregated <- aggregate(Emissions ~ year, coalNEISCC, sum)
print(coal_aggregated)

png("plot4.png")
library(ggplot2)
g <- ggplot(coal_aggregated, aes(factor(year), Emissions))
g <- g + geom_bar(stat = 'identity') + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Emission from Coal sources")
print(g)

dev.off()