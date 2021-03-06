library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
Baltimore<-subset(NEI,fips=="24510")
Baltimore<-transform(Baltimore, type=as.factor(type))
png("plot3.png",width=960,height=480)
ggplot(Baltimore,aes(x=as.factor(year),y=Emissions))+stat_summary(fun.y=mean,geom="bar")+facet_wrap(~type) +xlab("Years")
dev.off()
