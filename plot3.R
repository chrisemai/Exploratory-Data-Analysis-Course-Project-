##3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

# set directory
setwd("~/Desktop/Coursera/Exploratory Analysis/Week4")

## upload data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#aggregate by type and year in Baltimore
plot3agg <- aggregate(Emissions ~ year+type,data=subset(NEI,fips=="24510"), FUN=sum)

#plot emissions by year, disaggregated by type
ggplot(data=plot3agg, aes(x=year, y=Emissions, color=factor(type)))+
    geom_point(size=4)+
    ggtitle("Total Emissions by Type in Baltimore City")+
    geom_line()+
    labs(y="PM2.5 Total Emissions (tons)")

#save the file
dev.copy(png,'plot3.png')
dev.off()