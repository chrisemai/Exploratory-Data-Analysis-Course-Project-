##1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

# set directory
setwd("~/Desktop/Coursera/Exploratory Analysis/Week4")

## upload data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#aggregate emisions by year
plot1agg <- aggregate(Emissions~year, data=NEI, FUN=sum)

#plot emissions by year
plot(plot1agg$year,plot1agg$Emissions, main="Total Emissions in the United States",
     xlab="Year", ylab="PM2.5 Total Emissions (tons)", col="blue", pch=20,
     xaxt="none", type='l')
axis(1, at=c(1999,2002,2005,2008))

#save the file
dev.copy(png,'plot1.png')
dev.off()
