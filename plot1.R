# Set working directory and import files
setwd("C:/Users/jnony/Desktop/exdata_data_NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# 1 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


EmissionByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
with(EmissionByYear, barplot(height = Emissions, names.arg = year, xlab = "year", ylab = expression('PM'[2.5]*' in kilotons'), 
                             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))

dev.off()