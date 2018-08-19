##4
#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

# set directory
setwd("~/Desktop/Coursera/Exploratory Analysis/Week4")

## upload data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#first find the SCC codes associated with coal combustions
subset4 <- subset(SCC,grepl("Fuel Comb",EI.Sector) & grepl("Coal",EI.Sector)) 

#filter NEI for an rows with an SCC code in the subset4 table. Aggregate emissions by year
library(ggplot2)
plot4agg <- aggregate(Emissions~year, data=subset(NEI,SCC %in% subset4$SCC), FUN=sum)

ggplot(data=plot4agg, aes(x=year, y=Emissions))+
    geom_point(size=4, col="blue")+
    ggtitle("Total Coal Combustion-Related Emissions in the US")+
    geom_line(col="blue")

#save the file
dev.copy(png,'plot4.png')
dev.off()