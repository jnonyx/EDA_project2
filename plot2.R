# Set working directory and import files
setwd("C:/Users/jnony/Desktop/exdata_data_NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset on fips
Balt <- subset(NEI, fips == 24510)
AggBalt <- aggregate(Emissions ~ year, Balt, sum)
str(Balt)
png('plot2.png')
with(AggBalt, barplot(height = Emissions, names.arg = year, xlab = "year", ylab = expression('PM'[2.5]*' in kilotons'), 
                      main = expression('Annual Emission PM'[2.5]*' in Baltimore')))

dev.off()