##2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#set directory
setwd("~/Desktop/Coursera/Exploratory Analysis/Week4")

## upload data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#aggregate emissions by year for Baltimore only
plot2agg <- aggregate(Emissions~year, data=subset(NEI,fips=="24510"), FUN=sum)

#plot emissions by year in Baltimore
plot(plot2agg$year,plot2agg$Emissions, main="Total Emissions in Baltimore City, MD",
     ylab="PM2.5 Total Emissions (tons)", xlab="Year", col="blue", 
     pch=19, xaxt="none", type='l') 
axis(1, at=c(1999,2002,2005,2008))

#save the file
dev.copy(png,'plot2.png')
dev.off()