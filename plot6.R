##6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

# set directory
setwd("~/Desktop/Coursera/Exploratory Analysis/Week4")

## upload data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#find the SCC values associated with motor vehicles 
subset6 <- subset(SCC,grepl("Vehicles",EI.Sector)) 

#aggregate the data of emissions by year, disaggragated by fips code
plot6agg <- aggregate(Emissions~year+fips, data=subset(NEI,SCC %in% subset6$SCC & 
                                                           (fips=="24510" | fips == "06037")), FUN=sum)

#plot emissions by year in the two cities
ggplot(data=plot6agg, aes(x=year, y=Emissions,color=factor(fips, labels=c("Los Angeles","Baltimore City"))))+
    geom_point(size=4)+
    ggtitle("Motor Vehicle Emissions in Baltimore City and LA")+
    geom_line()+
    labs(color = "City", y="Emissions (tons)")

#save the file
dev.copy(png,'plot6.png')
dev.off()