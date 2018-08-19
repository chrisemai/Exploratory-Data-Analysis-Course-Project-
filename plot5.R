##5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# set directory
setwd("~/Desktop/Coursera/Exploratory Analysis/Week4")

## upload data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#find the SCC values associated with motor vehicles
subset5 <- subset(SCC,grepl("Vehicles",EI.Sector)) 

#aggregate emissions by year in Baltimore for motor vehicle sources
plot5agg <- aggregate(Emissions~year, data=subset(NEI,SCC %in% subset5$SCC & fips=="24510"), FUN=sum)

#plot emissions by year
ggplot(data=plot5agg, aes(x=year, y=Emissions))+
    geom_point(size=4, col="blue")+
    ggtitle("Motor Vehicle Emissions in Baltimore City")+
    geom_line(col="blue")+
    labs(y="Emissions (tons)")

#save the file
dev.copy(png,'plot5.png')
dev.off()