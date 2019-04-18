# Set working directory and import files
setwd("C:/Users/jnony/Desktop/exdata_data_NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Balt_and_LA <- NEI[(NEI$fips == "24510" | NEI$fips =="06037") & NEI$type =="ON-ROAD", ]
BnL_aggregated <- aggregate(Emissions ~ year + fips, Balt_and_LA, sum)?
  BnL_aggregated$fips[BnL_aggregated$fips == "24510"] <- "Baltimore, MD"
BnL_aggregated$fips[BnL_aggregated$fips == "06037"] <- "Los Angeles, CA"


library(ggplot2)

png("plot6.png")
bl <- ggplot(BnL_aggregated, aes(factor(year), Emissions))
bl <- bl + facet_grid(. ~ fips)
bl <- bl + geom_bar(stat = 'identity') + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Emissions from Motor Vehicle in Baltimore")
print(bl)


dev.off()

