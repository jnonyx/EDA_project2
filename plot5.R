# Set working directory and import files
setwd("C:/Users/jnony/Desktop/exdata_data_NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Balt_motor <- NEI[NEI$fips == "24510" & NEI$type =="ON-ROAD", ]
Balt_motor_aggregated <- aggregate(Emissions ~ year, Balt_motor, sum)
print(Balt_motor_aggregated)
library(ggplot2)

png("plot5.png")
b <- ggplot(Balt_motor_aggregated, aes(factor(year), Emissions))
b <- b + geom_bar(stat = 'identity') + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Emissions from Motor Vehicle in Baltimore")
print(b)
dev.off()